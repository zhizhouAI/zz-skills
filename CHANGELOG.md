# 更新日志

格式参考 Keep a Changelog；版本号遵循语义化版本。

## [1.1.0] - 2026-11-20

### 新增
- **个人档案层**：新技能 `zz-profile`，建档后全库内容技能越用越懂你（读 `profile/` 目录）
- **判断校准飞轮**：新技能 `zz-result-loop`，发布数据回填 → `profile/校准记录.md` → 反哺 `zz-topic-score` 预测区间
- **场景包**：`packs/` 下三个一键安装组合——小红书起号包 / 生意诊断包 / 副业起步包，`install.sh --pack` 支持
- **技能评测体系**：`evaluation/` 下 38 份考题（每技能 3 道：常规/边界/刁钻），`./scripts/evaluate.sh` 校验，README 挂评测徽章
- **共享词表**：`shared/wordlists/` 三份（AI 腔黑名单 / 包装词黑名单 / 平台风险 starter 词表），四个内容技能统一引用
- **技能模板**：`_template/`（九段骨架 + 写作规范），`zz-skill-forge` 建新技能直接引用
- **CI 门禁**：GitHub Actions 每次推送自动校验技能规范、评测集、仓库卫生
- `zz-skill-forge` 新增「导出多平台版本」：同一方法输出 Grok Bot / Coze / 单页版
- `install.sh` 新增 `--version` / `--check-update` / `--pack` / `--pack-list`
- README 新增英文版 `README.en.md`

### 变更
- 全部 36+2 技能 frontmatter 增加 `status` 字段（stable/beta）
- `zz-risk-line` 增加免责与词表说明节
- `zz` 调度台新增「新手入门」引导、场景包路由、`zz-profile`/`zz-result-loop` 接力链

## [1.0.0] - 2026-11-20

### 新增
- 首个公开版本：36 个技能 + 入口调度台 + 安装脚本 + MIT→CC BY-NC 4.0 使用条款
