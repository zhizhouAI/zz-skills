#!/usr/bin/env python3
"""zz-skills 技能门禁：校验所有 SKILL.md 符合写作规范。
用法：python3 scripts/lint_skills.py
退出码 0 = 全部通过；1 = 有违规（打印清单）。
"""
import re
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
SKILLS = ROOT / "skills"
SECTIONS = ["## 一句话", "## 用与不用", "## 开工前要什么", "## 怎么做",
            "## 交付长什么样", "## 红线", "## 常见坑"]
BANNED = ["赋能", "抓手", "闭环", "底层逻辑"]
STATUSES = {"stable", "beta", "experimental"}
MIN_LINES = 60


def fail(issues, name, msg):
    issues.append(f"  ✗ {name}: {msg}")


def lint_one(skill_dir: Path, issues):
    name = skill_dir.name
    f = skill_dir / "SKILL.md"
    if not f.exists():
        fail(issues, name, "缺 SKILL.md")
        return
    text = f.read_text(encoding="utf-8")
    lines = text.splitlines()
    if len(lines) < MIN_LINES:
        fail(issues, name, f"行数 {len(lines)} 低于下限 {MIN_LINES}")

    # frontmatter
    if not text.startswith("---"):
        fail(issues, name, "缺 YAML frontmatter")
        return
    end = text.find("\n---", 3)
    if end == -1:
        fail(issues, name, "frontmatter 未闭合")
        return
    fm = text[3:end]
    m_name = re.search(r"^name:\s*(\S+)", fm, re.M)
    m_desc = re.search(r"^description:\s*(.+)", fm, re.M)
    m_status = re.search(r"^status:\s*(\S+)", fm, re.M)
    if not m_name:
        fail(issues, name, "frontmatter 缺 name")
    elif m_name.group(1) != name:
        fail(issues, name, f"name={m_name.group(1)} 与目录名不一致")
    if not m_desc:
        fail(issues, name, "frontmatter 缺 description")
    elif len(m_desc.group(1)) < 40:
        fail(issues, name, f"description 过短（{len(m_desc.group(1))} 字符，需≥40）")
    if not m_status:
        fail(issues, name, "frontmatter 缺 status")
    elif m_status.group(1) not in STATUSES:
        fail(issues, name, f"status={m_status.group(1)} 不在 {sorted(STATUSES)}")

    # 九段结构与顺序
    pos, last = [], -1
    for sec in SECTIONS:
        idx = next((i for i, l in enumerate(lines) if l.strip() == sec), None)
        if idx is None:
            fail(issues, name, f"缺小节 {sec}")
        else:
            pos.append(idx)
            if idx <= last:
                fail(issues, name, f"小节顺序错误：{sec}")
            last = idx

    # 空话检测（黑名单语境豁免：行内含「禁/黑名单/不出现/删掉/词表/空话」视为引用或教学语境）
    for w in BANNED:
        for i, l in enumerate(lines, 1):
            if w in l and not re.search(r"禁|黑名单|不出现|删掉|词表|空话", l):
                fail(issues, name, f"第 {i} 行出现禁用词「{w}」：{l.strip()[:40]}")


def main():
    issues = []
    dirs = sorted(p for p in SKILLS.iterdir() if p.is_dir())
    for d in dirs:
        lint_one(d, issues)
    print(f"检查 {len(dirs)} 个技能目录")
    if issues:
        print("\n".join(issues))
        print(f"\n结果：{len(issues)} 处违规")
        sys.exit(1)
    print("结果：全部通过 ✓")


if __name__ == "__main__":
    main()
