#!/usr/bin/env bash
# zz-skills 安装脚本：把 zz 技能复制到指定 Agent 的技能目录
# 用法：
#   ./install.sh                     交互式：检测目标目录，让你选
#   ./install.sh --all <目标目录>     全量装到指定目录
#   ./install.sh --only zz,zz-biz-check <目标目录>   只装指定技能
#   ./install.sh --list              列出全部技能

set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SRC="$REPO_DIR/skills"

COMMON_TARGETS=(
  "$HOME/.claude/skills"
  "$HOME/.codex/skills"
)

usage() {
  sed -n '2,7p' "$0"
  exit 0
}

list_skills() {
  echo "zz-skills 全部技能："
  for d in "$SRC"/*/; do
    name="$(basename "$d")"
    desc="$(awk '/^description:/{sub(/^description: */,""); print; exit}' "$d/SKILL.md" 2>/dev/null | cut -c1-60)"
    echo "  $name  ${desc}..."
  done
}

target_has_existing() { # $1=target $2=name
  [ -d "$1/$2" ]
}

install_to() {
  local target="$1"; shift
  local names=("$@")
  mkdir -p "$target"
  local installed=0 skipped=0
  for name in "${names[@]}"; do
    if target_has_existing "$target" "$name"; then
      echo "  覆盖已存在的 $name（会覆盖你本地对它的修改）"
    fi
    cp -R "$SRC/$name" "$target/$name"
    installed=$((installed+1))
  done
  echo "完成：$installed 个技能 → $target"
  echo "验证：在你的 Agent 里输入 zz 试一下。"
}

ALL_NAMES=()
for d in "$SRC"/*/; do ALL_NAMES+=("$(basename "$d")"); done

case "${1:-}" in
  --list) list_skills; exit 0 ;;
  -h|--help|"") : ;;
  *) usage ;;
esac

MODE="all"; ONLY=""; TARGET=""
shift_count=0
while [ $# -gt 0 ]; do
  case "$1" in
    --only) MODE="only"; ONLY="$2"; shift 2 ;;
    *) TARGET="$1"; shift ;;
  esac
done

# 选定要装的技能
if [ "$MODE" = "only" ]; then
  IFS=',' read -r -a NAMES <<< "$ONLY"
  for n in "${NAMES[@]}"; do
    [ -d "$SRC/$n" ] || { echo "找不到技能：$n（用 --list 查看全部）"; exit 1; }
  done
else
  NAMES=("${ALL_NAMES[@]}")
fi

# 确定目标目录
if [ -n "$TARGET" ]; then
  install_to "$TARGET" "${NAMES[@]}"
  exit 0
fi

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
