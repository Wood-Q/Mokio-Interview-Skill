# LapisCV 模板参考

LapisCV v2.x Markdown 模板格式，用于 VS Code。所有简历输出必须符合此规范。

## ⚠️ 必须：创建简历前先设置 LapisCV

LapisCV 不只是 Markdown 格式——它包括正确渲染和导出 PDF 所需的 CSS 样式表、字体和 VS Code 设置。你必须在写任何简历之前复制 LapisCV 资源。

**将 LapisCV 资源复制到当前工作目录（平铺，不放入子目录）：**

```bash
SKILL_DIR="skills/mokio-interview-skill"
cp -r "${SKILL_DIR}/assets/lapis-cv-vscode-v2.0.1/.vscode" ./
cp -r "${SKILL_DIR}/assets/lapis-cv-vscode-v2.0.1/lapis-cv" ./
cp "${SKILL_DIR}/assets/lapis-cv-vscode-v2.0.1/template-cn.md" ./
cp "${SKILL_DIR}/assets/lapis-cv-vscode-v2.0.1/template-en.md" ./
```

**如果工作目录已有全部四项**（`.vscode/`、`lapis-cv/`、`template-cn.md`、`template-en.md`），跳过此步骤。

**为什么平铺复制？** `.vscode/settings.json` 通过相对路径引用 `./lapis-cv/styles/...`。简历 .md 文件必须与 `lapis-cv/` 和 `.vscode/` 在同一目录层级，CSS 才能在 VS Code Markdown 预览中正确加载。

**复制后的目录结构：**

```
.
├── .vscode/
│   └── settings.json
├── lapis-cv/
│   ├── fonts/
│   │   ├── JetBrainsMono-Regular.ttf
│   │   ├── SourceHanSansCN-Bold.ttf
│   │   ├── SourceHanSansCN-Medium.ttf
│   │   ├── SourceHanSansCN-Regular.ttf
│   │   ├── SourceHanSerifCN-Bold.ttf
│   │   └── iconfont.ttf
│   └── styles/
│       ├── lapis-cv-serif.css
│       ├── lapis-cv.css
│       └── main.css
├── template-cn.md
└── template-en.md
```

**导出 PDF：**

1. 在 VS Code 扩展商店搜索并安装 **Markdown PDF** 插件
2. 在 VS Code 中打开简历 .md 文件（确保样式正确渲染）
3. 右键点击编辑器 → 选择 **Markdown PDF: Export (pdf)**
4. PDF 文件将自动生成在同目录下

**红旗 —— 如果 LapisCV 资源不存在则停止：**
- 在没有 `lapis-cv/styles/` 和 `lapis-cv/fonts/` 的同目录下写简历 .md 文件
- 将简历放在子目录中（CSS 相对路径会失效）
- 忘记复制 `.vscode/settings.json`（预览无法加载样式）

## 权威模板

权威的 LapisCV 模板在技能的 assets 目录中。**生成简历时始终直接读取这些文件**——它们定义了精确的格式、图标用法和结构。

| 模板 | 路径 | 语言 |
|----------|------|----------|
| 中文 | `assets/lapis-cv-vscode-v2.0.1/template-cn.md` | 中文简历 |
| 英文 | `assets/lapis-cv-vscode-v2.0.1/template-en.md` | English resume |

**生成简历时：**
1. 从 assets 读取对应的模板文件
2. 精确复制其结构——图标代码、`<span class="icon">` vs `<span alt="icon">`、`div` 属性、`blockquote` 格式
3. 用用户信息替换占位内容
4. 不要凭记忆编写格式细节——始终检查实际模板

**中文模板和英文模板的关键区别：**

| 元素 | 中文模板（`template-cn.md`） | 英文模板（`template-en.md`） |
|---------|---------------------------|---------------------------|
| 联系方式图标 | `<span class="icon">` | `<span alt="icon">` |
| 联系方式布局 | 每项在单独的 `>` 行 | 所有项在同一 `>` 行 |
| 教育格式 | `学校 - 学历 - 专业` 在 `h3` 中 | `University Name` 在 `h3` 中，学位在下方 |
| 日期格式 | `YYYY.MM - YYYY.MM` | `Month Year - Month Year` |
| 章节名称 | 教育经历、工作经验、项目经历、专业技能 | Education, Work Experience, Projects, Skills |

## 图标映射

| 图标代码 | 用途 | 显示 |
|-----------|-------|---------|
| `&#xe60f;` | 手机 | 手机号前的手机图标 |
| `&#xe7ca;` | 邮箱 | 邮箱地址前的邮箱图标 |
| `&#xe600;` | GitHub/链接 | GitHub URL 前的链接图标 |
| `&#xe80c;` | 教育 | 教育经历章节标题图标 |
| `&#xe618;` | 工作 | 工作经验章节标题图标 |
| `&#xe635;` | 项目 | 项目经历章节标题图标 |
| `&#xecfa;` | 技能 | 专业技能章节标题图标 |

**联系方式栏中的图标用法：** 用 `<span alt="icon">&#xeXXXX;</span>` 包裹（英文模板）或 `<span class="icon">&#xeXXXX;</span>`（中文模板）
**章节标题中的图标用法：** 追加在 `## ` 之后（如 `## &#xe80c; 教育经历`）

## 格式规范

### 头部区域
- `h1` = 全名（居中渲染，16pt）
- `blockquote` = 联系方式栏（居中渲染，9.5pt）
  - 每个联系方式项：图标 + 内容，用 `&emsp;&emsp;` 分隔
  - 手机号用反引号：`` `手机号` ``
  - 邮箱用反引号：`` `邮箱` ``
  - URL 用 Markdown 链接：`[文本](url)`
- `img alt="avatar"` = 头像照片（可选）
  - 圆形裁剪，右对齐
  - 来源：URL 或本地路径

### 章节标题
- 每个章节：`h2` + 图标前缀 + 章节名
- 渲染时带强调色下划线
- 标准章节：教育经历、工作经验、项目经历、专业技能

### 条目标题行
```html
<div alt="entry-title">
    <h3>标题 - 副标题</h3>
    <p>日期范围</p>
</div>
```
- 渲染为弹性布局：标题左，日期右
- 标题文本用 `h3`，日期用 `p`
- 项目链接用 `a` 标签代替 `p`（右侧）

### 要点
- 标准 Markdown `- ` 项目符号
- 加粗类别/标签：`- **类别**: 内容`
- 每个要点应是一行有影响力的内容

### 分页
- `---`（水平线）在打印/PDF 中创建分页

### 日期格式
- 英文：`Month Year - Month Year`（如 `Sept 2023 - June 2025`）
- 中文：`YYYY.MM - YYYY.MM`（如 `2023.09 - 2025.06`）
- 至今：`Month Year - Present` 或 `YYYY.MM - 至今`

## CSS 自定义变量

| 变量 | 默认值 | 用途 |
|----------|---------|---------|
| `--text-size` | 10pt | 正文大小 |
| `--line-height` | 1.8 | 行高 |
| `--avatar-width` | 28mm | 头像直径 |
| `--h1-size` | 16pt | 姓名大小 |
| `--h2-size` | 12pt | 章节标题大小 |
| `--h3-size` | 10.5pt | 条目标题大小 |
| `--blockquote-size` | 9.5pt | 联系方式栏大小 |
| `--color-accent` | #00327dac | 强调色（标题、图标、链接） |
| `--text-normal` | #353a42 | 正文颜色 |
| `--border-color` | #dae3ea | 边框和分隔线颜色 |

**衬线变体：** 将 `--title-font` 替换为 `'SourceHanSerifCN'` 并将 `--color-accent` 调整为 `#4870ad`。

## 要点写作规则

**每个要点必须遵循此结构：**

```
- **强动词** + 你做了什么 + 具体细节 + 量化结果
```

**强动词：** 主导、设计、实现、优化、降低、提升、构建、部署、自动化、迁移、架构、交付、解决、重构、集成

**禁止使用的弱动词：** 参与了、协助了、负责了、参与了、辅助了、涉及了

**量化规则：**
- 每个要点应至少包含一个数字（百分比、数量、时间、规模）
- 如果项目中没有可用数字，改为描述具体的技术挑战
- 永远不要编造数字——如果用户没有提及指标且无法从代码推导，使用定性的具体描述

**示例：**

```
- **实现**了 JWT 认证 + bcrypt 密码哈希，将认证流程延迟从 12.8s 降至 2.3s
- **设计**了微服务架构，通过 Redis pub/sub 支撑 10K+ 并发 WebSocket 连接
- **优化**了数据库查询性能，通过添加复合索引将 P99 延迟从 800ms 降至 120ms
```
