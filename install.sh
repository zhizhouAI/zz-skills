#!/usr/bin/env bash
# zz-skills 安装脚本：把 zz 技能复制到指定 Agent 的技能目录，支持场景包与版本检查
# 用法：
#   ./install.sh                          交互式：检测目标目录，让你选
#   ./install.sh --all <目标目录>          全量装到指定目录
#   ./install.sh --only zz,zz-biz-check <目标目录>   只装指定技能
#   ./install.sh --pack 小红书起号包 [目标目录]      装一个场景包（技能装到目标目录，工作目录建在当前目录）
#   ./install.sh --pack-list              列出全部场景包
#   ./install.sh --list                   列出全部技能
#   ./install.sh --version                显示本地版本
#   ./install.sh --check-update           对比远端最新版本

set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SRC="$REPO_DIR/skills"
PACKS="$REPO_DIR/packs"
RAW_BASE="https://raw.githubusercontent.com/zhizhouAI/zz-skills/main"

COMMON_TARGETS=(
  "$HOME/.claude/skills"
  "$HOME/.codex/skills"
)

usage() { sed -n '2,13p' "$0"; exit 0; }

list_skills() {
  echo "zz-skills 全部技能："
  for d in "$SRC"/*/; do
    name="$(basename "$d")"
    desc="$(awk '/^description:/{sub(/^description: */,""); print; exit}' "$d/SKILL.md" 2>/dev/null | cut -c1-60)"
    echo "  $name  ${desc}..."
  done
}

list_packs() {
  echo "可用场景包："
  for p in "$PACKS"/*.md; do
    base="$(basename "$p" .md)"
    [ "$base" = "README" ] && continue
    n=$(grep -m1 '^skills:' "$p" | grep -o '[a-z-]*zz[a-z-]*' | wc -l | tr -d ' ')
    echo "  $base（$n 个技能）—— 用 ./install.sh --pack \"$base\" 安装"
  done
}

pack_skills() { # $1=包名 → 输出技能名列表
  grep -m1 '^skills:' "$PACKS/$1.md" | sed 's/skills:[[:space:]]*//; s/[][]//g; s/,/ /g'
}

pack_dirs() { # $1=包名 → 输出 setup_dirs 列表
  grep -m1 '^setup_dirs:' "$PACKS/$1.md" 2>/dev/null | sed 's/setup_dirs:[[:space:]]*//; s/[][]//g; s/,/ /g' || true
}

install_to() {
  local target="$1"; shift
  local names=("$@")
  mkdir -p "$target"
  local installed=0
  for name in "${names[@]}"; do
    [ -d "$SRC/$name" ] || { echo "  ⚠ 跳过 $name（仓库里没有）"; continue; }
    [ -d "$target/$name" ] && echo "  覆盖已存在的 $name（会覆盖你本地对它的修改）"
    cp -R "$SRC/$name" "$target/$name"
    installed=$((installed+1))
  done
  echo "完成：$installed 个技能 → $target"
}

ALL_NAMES=()
for d in "$SRC"/*/; do ALL_NAMES+=("$(basename "$d")"); done

MODE="all"; ONLY=""; PACK=""; TARGET=""; VER_MODE=""
while [ $# -gt 0 ]; do
  case "$1" in
    --only) MODE="only"; ONLY="$2"; shift 2 ;;
    --pack) MODE="pack"; PACK="$2"; shift 2 ;;
    --pack-list) list_packs; exit 0 ;;
    --list) list_skills; exit 0 ;;
    --version) VER_MODE="local"; shift ;;
    --check-update) VER_MODE="check"; shift ;;
    -h|--help) usage ;;
    *) TARGET="$1"; shift ;;
  esac
done

case "$VER_MODE" in
  local) echo "zz-skills v$(cat "$REPO_DIR/VERSION")"; exit 0 ;;
  check)
    LOCAL=$(cat "$REPO_DIR/VERSION")
    REMOTE=$(curl -sf --max-time 10 "$RAW_BASE/VERSION" || echo "unknown")
    echo "本地: v$LOCAL ｜ 远端: ${REMOTE}"
    [ "$LOCAL" = "$REMOTE" ] && echo "已是最新 ✓" || echo "有新版本，重新克隆或 git pull 后重跑 install.sh"
    exit 0 ;;
esac

if [ "$MODE" = "pack" ]; then
  [ -f "$PACKS/$PACK.md" ] || { echo "没有这个场景包：$PACK（用 --pack-list 查看）"; exit 1; }
  IFS=' ' read -r -a NAMES <<< "$(pack_skills "$PACK")"
  echo "场景包【$PACK】：${NAMES[*]}"
  if [ -z "$TARGET" ]; then
    echo "选择安装目标："
    i=1
    for t in "${COMMON_TARGETS[@]}"; do echo "  $i) $t"; i=$((i+1)); done
    read -r -p "序号: " pick
    if [ "$pick" -le "${#COMMON_TARGETS[@]}" ] 2>/dev/null; then
      TARGET="${COMMON_TARGETS[$((pick-1))]}"
    else
      read -r -p "目录路径: " TARGET
    fi
  fi
  install_to "$TARGET" "${NAMES[@]}"
  # 工作目录建在当前目录（profile/ 和 saves/ 是你的数据，不进技能目录）
  IFS=' ' read -r -a DIRS <<< "$(pack_dirs "$PACK")"
  for dd in "${DIRS[@]:-}"; do
    [ -n "$dd" ] && mkdir -p "$dd" && echo "已建工作目录: $(pwd)/$dd"
  done
  echo "验证：在 Agent 里输入 /zz 试一下；建议第一次对话直接说「$PACK 起步」。"
  exit 0
fi

if [ "$MODE" = "only" ]; then
  IFS=',' read -r -a NAMES <<< "$ONLY"
  for n in "${NAMES[@]}"; do
    [ -d "$SRC/$n" ] || { echo "找不到技能：$n（用 --list 查看全部）"; exit 1; }
  done
else
  NAMES=("${ALL_NAMES[@]}")
fi

if [ -n "$TARGET" ]; then
  install_to "$TARGET" "${NAMES[@]}"
else
  echo "选择安装目标："
  i=1
  for t in "${COMMON_TARGETS[@]}"; do echo "  $i) $t"; i=$((i+1)); done
  echo "  $i) 自己输入一个目录"
  read -r -p "序号: " pick
  if [ "$pick" -le "${#COMMON_TARGETS[@]}" ] 2>/dev/null; then
    TARGET="${COMMON_TARGETS[$((pick-1))]}"
  else
    read -r -p "目录路径: " TARGET
  fi
  install_to "$TARGET" "${NAMES[@]}"
fi
echo "验证：在你的 Agent 里输入 zz 试一下。"
