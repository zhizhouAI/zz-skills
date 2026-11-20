#!/usr/bin/env bash
# zz-skills 评测集校验：每个技能必须有考题文件，且结构完整（≥3 道，含场景/输入/合格要点）。
# 用法：./scripts/evaluate.sh
set -uo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
EVAL_DIR="$ROOT/evaluation"
fail=0; total=0

for d in "$ROOT"/skills/*/; do
  name="$(basename "$d")"
  exam="$EVAL_DIR/$name.exam.md"
  total=$((total+1))
  if [ ! -f "$exam" ]; then
    echo "  ✗ $name: 缺考题文件 $name.exam.md"; fail=$((fail+1)); continue
  fi
  q=$(grep -c '^## 考题' "$exam")
  if [ "$q" -lt 3 ]; then
    echo "  ✗ $name: 考题数 $q < 3"; fail=$((fail+1)); continue
  fi
  missing=""
  grep -q '场景' "$exam" || missing="$missing 场景"
  grep -q '输入' "$exam" || missing="$missing 输入"
  grep -q '合格要点' "$exam" || missing="$missing 合格要点"
  if [ -n "$missing" ]; then
    echo "  ✗ $name: 考题缺字段:$missing"; fail=$((fail+1)); continue
  fi
  echo "  ✓ $name: $q 道考题"
done

echo "校验 $total 个技能的考题"
if [ "$fail" -gt 0 ]; then echo "结果：$fail 个技能的评测集不合格"; exit 1; fi
echo "结果：评测集全部通过 ✓"
