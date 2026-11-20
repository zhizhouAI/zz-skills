<img width="1024" height="765" alt="zz-skills" src="https://github.com/user-attachments/assets/79572ba6-3241-4e63-bff9-ca42c745aaa6" />

# 之舟 zz-skills

**让 Agent 先想清楚，再动手——越用越懂你。**

![Version](https://img.shields.io/badge/version-1.1.0-2563EB.svg?style=flat-square)
![评测](https://img.shields.io/badge/%E8%AF%84%E6%B5%8B%2038%2F38%20%E9%80%9A%E8%BF%87-16A34A.svg?style=flat-square)
![License](https://img.shields.io/badge/license-CC%20BY--NC%204.0-F59E0B.svg?style=flat-square)
[![skills.sh](https://skills.sh/b/zhizhouAI/zz-skills)](https://skills.sh/b/zhizhouAI/zz-skills)

简体中文 ｜ [English](README.en.md)

一套中文 Agent 工作系统：36 个技能，覆盖「把事想清楚 → 做内容 → 推动自己 → 沉淀复盘」的完整循环。装进任何支持 Skills 的 Agent（Kimi、DeepSeek、Claude Code、Codex、WorkBuddy、智谱 等）后，对话里直接调用。

> **使用条款**：个人使用、学习、修改免费；**任何商用场景（收费课程、商业产品内置、代客交付等）需事先取得书面授权**。转发请注明本仓库地址。详见 [LICENSE](LICENSE)。

## 快速开始

```bash
git clone https://github.com/zhizhouAI/zz-skills.git
cd zz-skills
./install.sh                                # 交互式选择安装到哪个 Agent
./install.sh --pack 小红书起号包             # 或一键装一个场景包（推荐新手）
```

也可以手动复制：把 `skills/` 下任意技能目录拷进 Agent 的技能目录（如 `~/.claude/skills/`）。

装好后，在对话里输入 `/zz` 加上你的情况即可。信息不全也没关系，调度台会先问清楚再动手：

```text
/zz 我在做少儿编程课，40 个学员但续费很低，不知道先查产品还是查定价
```

## 技能总览

### 入口

| 技能 | 干什么 |
| --- | --- |
| `zz` | 调度台：问清你要的结果，安排技能顺序，在当前对话里推进；说「新手入门」有专属引导 |
| `zz-skill-setup` | 安装、更新技能，清理重复入口 |

### 档案与校准（差异化核心）

| 技能 | 干什么 |
| --- | --- |
| `zz-profile` | 个人档案层：建档后全库内容技能越用越懂你 |
| `zz-result-loop` | 判断校准飞轮：发布数据回填，修正你下次的预测 |

### 想清楚

| 技能 | 干什么 |
| --- | --- |
| `zz-ask-reset` | 把模糊问题改写成能回答的问题 |
| `zz-term-map` | 拆解说不清的概念，定下本次讨论的定义 |
| `zz-why-buy` | 分析顾客为什么选你、为什么放弃你 |
| `zz-target-lock` | 模糊愿望 → 可检查的目标和完成标准 |
| `zz-evidence-check` | 检查方法论里的判断有没有可信依据 |
| `zz-best-answer` | 给出"什么条件下用什么做法"的带条件答案 |

### 生意与选题

| 技能 | 干什么 |
| --- | --- |
| `zz-biz-check` | 生意体检，给出明天要做的第一件事 |
| `zz-rival-file` | 拆解值得学习的同行怎么获客、转化、交付 |
| `zz-topic-plan` | 把定好的选题做成完整内容方案 |
| `zz-topic-score` | 写之前判断选题值不值得做 |
| `zz-hit-autopsy` | 倒推一条内容为什么爆（或为什么翻车） |

### 内容打磨

| 技能 | 干什么 |
| --- | --- |
| `zz-hook-three` | 四平台 × 标题/封面/开头，各出 3 组备选 |
| `zz-flat-fix` | 找出稿子哪里没打动人，给删改补建议 |
| `zz-swipe-map` | 逐字稿按时间轴标出观众会划走的位置 |
| `zz-ai-trace` | 标出文案的 AI 痕迹，你确认后再逐条协助改 |
| `zz-human-tone` | 把文字改成像真人随口说的话 |
| `zz-fact-first` | 按事实顺序写说明文，不加营销包装 |

### 发布与视频

| 技能 | 干什么 |
| --- | --- |
| `zz-risk-line` | 发布前逐句查平台风险，给最小修改方案 |
| `zz-gzh-html` | Markdown 排成可粘贴公众号后台的 HTML |
| `zz-video-data` | 取平台作品数据和语音文字稿 |
| `zz-video-chapters` | 本地视频切章节，生成导航标记 |

### 推动自己

| 技能 | 干什么 |
| --- | --- |
| `zz-stuck-break` | 分析"知道该做但没做"，给今天 15 分钟能做的一步 |
| `zz-course-loop` | 课题拆成系列文章，按反馈调整下一篇 |
| `zz-choice-log` | 决策记录 + 到期回填复盘 |

### 沉淀与讨论

| 技能 | 干什么 |
| --- | --- |
| `zz-save-point` | 存档当前结论和下一步 |
| `zz-continue` | 读存档接着干 |
| `zz-weekly-report` | 多份存档合并成阶段报告 |
| `zz-round-table` | 多位专家角色圆桌讨论，真有分歧那种 |
| `zz-school-table` | 不同经济学流派视角分析同一个问题 |
| `zz-base` | 本地文件夹建成可维护的知识库 |
| `zz-material-bank` | 旧文稿整理成可复用的素材库 |
| `zz-task-card` | 给协作者派活、跟进、验收 |
| `zz-skill-forge` | 制作或改进一个技能 |
| `zz-desktop-ops` | Agent 操作电脑的行为规范：危险动作先确认 |

## 为什么不一样

- **个人档案层**：`zz-profile` 建档后，选题、钩子、改稿全部对齐"你"——你的生意、你的口癖，不是通用模板。用得越久，档案越准
- **判断校准飞轮**：`zz-topic-score` 预测流量 → 发布后 `zz-result-loop` 回填实际数据 → 累积偏差记录反哺下次预测。让你的 Agent 比你自己更早发现你判断错了
- **场景包**：不装 36 个技能挑花眼，`--pack` 一键装"小红书起号包"这类精选组合，自带使用顺序
- **带考题的技能库**：每个技能配 3 道评测考题（`evaluation/`），`./scripts/evaluate.sh` 可随时验收，CI 自动把关——技能库也讲工程纪律

## 场景包

| 包 | 技能数 | 适用 |
| --- | --- | --- |
| 小红书起号包 | 7 | 从 0 到 1 做账号：建档→选题→钩子→改稿→风险→回填 |
| 生意诊断包 | 6 | 生意卡住：体检→挖动机→拆同行→记决定 |
| 副业起步包 | 7 | 想搞副业没行动：锁目标→拆卡点→存档续做 |

```bash
./install.sh --pack-list          # 看全部包
./install.sh --pack 生意诊断包    # 一键装
```

## 设计原则

- **每个技能有红线**：质量底线写成可检查的条款，不靠感觉
- **每个技能有考题**：3 道评测题（常规/边界/刁钻），改完跑评测防退化
- **技能间传产物**：上一个技能的交付物直接作为下一个的输入，不用你复述
- **示例具体**：每个技能配一个有行业、有数字的完整示例
- **危险动作慢一步**：凡涉及付款、删除、发送，先停下等你确认

## License

[CC BY-NC 4.0](LICENSE)（署名 — 非商业性使用）

- ✅ 个人使用、学习、修改、分享（需保留版权与来源声明）
- ❌ 商业用途需先取得书面授权：GitHub @zhizhouAI 私信
