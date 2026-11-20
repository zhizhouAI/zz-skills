# Zhizhou zz-skills

**Think first, act second — and it learns you as you go.**

![Version](https://img.shields.io/badge/version-1.1.0-2563EB.svg?style=flat-square)
![评测](https://img.shields.io/badge/%E8%AF%84%E6%B5%8B%2038%2F38%20%E9%80%9A%E8%BF%87-16A34A.svg?style=flat-square)
![License](https://img.shields.io/badge/license-CC%20BY--NC%204.0-F59E0B.svg?style=flat-square)
[![skills.sh](https://skills.sh/b/zhizhouAI/zz-skills)](https://skills.sh/b/zhizhouAI/zz-skills)

English | [简体中文](README.md)

A Chinese-language Agent work system: 36 Skills covering the complete loop of “think it through → make content → keep yourself moving → capture and review.” Load it into any Agent that supports Skills (Claude Code, Codex, WorkBuddy, and more), then invoke it straight from the conversation.

> **Terms of use**: Free for personal use, learning, and modification. **Any commercial scenario (paid courses, bundling into commercial products, client delivery, etc.) requires prior written authorization.** If you share it onward, please credit this repository. See [LICENSE](LICENSE).

## Quick Start

```bash
git clone https://github.com/zhizhouAI/zz-skills.git
cd zz-skills
./install.sh                                # interactively choose which Agent to install into
./install.sh --pack 小红书起号包             # or one-shot install a Pack (recommended for beginners)
```

You can also copy manually: drop any Skill directory under `skills/` into your Agent's skills directory (e.g. `~/.claude/skills/`).

Once installed, just type `/zz` plus your situation in the conversation. Partial info is fine — the Dispatcher asks clarifying questions before it acts:

```text
/zz 我在做少儿编程课，40 个学员但续费很低，不知道先查产品还是查定价
```

## Skill Overview

### Entry Points

| Skill | What it does |
| --- | --- |
| `zz` | Dispatcher: pins down the outcome you want, sequences the Skills, and moves the work forward right in your current conversation; say “新手入门” for a dedicated beginner walkthrough |
| `zz-skill-setup` | Installs and updates Skills, cleans up duplicate entry points |

### Profile & Calibration (The Differentiator)

| Skill | What it does |
| --- | --- |
| `zz-profile` | Profile Layer: once your profile is built, every content Skill in the library gets smarter about you the more you use it |
| `zz-result-loop` | Calibration Loop: publish data gets backfilled to correct your next prediction |

### Think It Through

| Skill | What it does |
| --- | --- |
| `zz-ask-reset` | Rewrites vague questions into ones that can actually be answered |
| `zz-term-map` | Unpacks concepts you can't quite articulate and sets the definitions for this discussion |
| `zz-why-buy` | Analyzes why customers choose you — and why they walk away |
| `zz-target-lock` | Turns a fuzzy wish into a checkable goal with a definition of done |
| `zz-evidence-check` | Checks whether the judgments inside a methodology rest on credible evidence |
| `zz-best-answer` | Gives conditional answers: which approach works under which conditions |

### Business & Topics

| Skill | What it does |
| --- | --- |
| `zz-biz-check` | Business Checkup that hands you the very first thing to do tomorrow |
| `zz-rival-file` | Breaks down how the peers worth learning from acquire, convert, and deliver |
| `zz-topic-plan` | Turns a chosen topic into a complete content plan |
| `zz-topic-score` | Judges whether a topic is worth writing before you write a word |
| `zz-hit-autopsy` | Reverse-engineers why a piece took off (or why it flopped) |

### Content Polish

| Skill | What it does |
| --- | --- |
| `zz-hook-three` | Four platforms × title/cover/opener, 3 sets of options each |
| `zz-flat-fix` | Pinpoints where a draft stops landing, with cut/revise/add suggestions |
| `zz-swipe-map` | Marks your script on a timeline, flagging exactly where viewers will swipe away |
| `zz-ai-trace` | Flags the AI tells in your copy, then helps you fix them one by one after you confirm |
| `zz-human-tone` | Rewrites text to sound like a real person talking off the cuff |
| `zz-fact-first` | Writes explainers in factual order, with no marketing varnish |

### Publishing & Video

| Skill | What it does |
| --- | --- |
| `zz-risk-line` | Sentence-by-sentence platform-risk check before publishing, with the smallest possible set of fixes |
| `zz-gzh-html` | Formats Markdown into HTML you can paste straight into the WeChat Official Account backend |
| `zz-video-data` | Pulls platform post metrics and voice transcripts |
| `zz-video-chapters` | Splits local videos into chapters and generates navigation markers |

### Keep Yourself Moving

| Skill | What it does |
| --- | --- |
| `zz-stuck-break` | Analyzes the “I know what to do but I'm not doing it” gap and gives you one step you can finish in 15 minutes today |
| `zz-course-loop` | Splits a subject into an article series and tunes the next piece to feedback |
| `zz-choice-log` | Decision log + retro backfilled when it comes due |

### Capture & Discussion

| Skill | What it does |
| --- | --- |
| `zz-save-point` | Saves your current conclusions and next step |
| `zz-continue` | Reads the save and picks up where you left off |
| `zz-weekly-report` | Merges multiple saves into a progress report |
| `zz-round-table` | A round table of expert personas — the kind with real disagreements |
| `zz-school-table` | Analyzes one question through competing schools of economic thought |
| `zz-base` | Turns a local folder into a maintainable knowledge base |
| `zz-material-bank` | Turns old drafts into a reusable material bank |
| `zz-task-card` | Hands work to collaborators, tracks it, and signs off on delivery |
| `zz-skill-forge` | Builds or improves a Skill |
| `zz-desktop-ops` | Ground rules for Agents operating a computer: confirm before dangerous actions |

## Why It's Different

- **Profile Layer**: once `zz-profile` builds your profile, topic picks, hooks, and rewrites all align to “you” — your business, your verbal habits, not a generic template. The longer you use it, the sharper your profile gets
- **Calibration Loop**: `zz-topic-score` predicts traffic → after publishing, `zz-result-loop` backfills the actual numbers → accumulated error records feed the next prediction. Your Agent spots your bad calls before you do
- **Packs**: skip the option overload of 36 Skills — `--pack` installs a curated Pack such as 小红书起号包 (Xiaohongshu Launch) in one shot, usage order included
- **A skill library with Exams**: every Skill ships with 3 evaluation Exams (`evaluation/`); `./scripts/evaluate.sh` verifies anytime and CI gates automatically — engineering discipline applies to skill libraries too

## Packs

| Pack | Skills | Best for |
| --- | --- | --- |
| 小红书起号包 (Xiaohongshu Launch) | 7 | Building an account from 0 to 1: profile → topics → hooks → rewrites → risk → backfill |
| 生意诊断包 (Business Diagnosis) | 6 | A stuck business: checkup → motivation mining → rival teardown → decision log |
| 副业起步包 (Side Hustle Starter) | 7 | Side-hustle ambition, zero action: lock the goal → break the blockers → save and resume |

```bash
./install.sh --pack-list          # list all packs
./install.sh --pack 生意诊断包    # one-shot install
```

## Design Principles

- **Every Skill has red lines**: quality floors written as checkable clauses, not vibes
- **Every Skill has Exams**: 3 exam questions each (standard / edge / tricky); rerun them after every change to catch regressions
- **Skills hand off their outputs**: one Skill's deliverable feeds straight into the next as input — you never have to restate it
- **Examples are concrete**: every Skill ships with a complete worked example, with a real industry and real numbers
- **Risky actions slow down by one beat**: anything touching payment, deletion, or sending stops and waits for your confirmation

## License

[CC BY-NC 4.0](LICENSE) (Attribution — NonCommercial)

- ✅ Personal use, learning, modification, and sharing (copyright and source attribution must be retained)
- ❌ Commercial use requires prior written authorization: zhizhouAI@users.noreply.github.com
