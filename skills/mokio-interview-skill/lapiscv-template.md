# LapisCV Template Reference

LapisCV v2.x Markdown template format for VS Code. All resume output MUST comply with this specification.

## ⚠️ MANDATORY: Download LapisCV Before Creating Resumes

LapisCV is NOT just a Markdown format — it includes CSS stylesheets, fonts, and rendering configuration required for proper PDF export. You MUST download the actual project, not just write Markdown.

**Download link:** https://github.com/BingyanStudio/LapisCV/releases

**Download and setup steps:**

```bash
# 1. Download the latest VS Code extension zip from Releases page
curl -L -o lapis-cv.zip "https://github.com/BingyanStudio/LapisCV/releases/download/v2.0.1/lapis-cv-vscode-v2.0.1.zip"

# 2. Unzip
unzip lapis-cv.zip -d lapis-cv-project

# 3. The resume Markdown file goes INSIDE the unzipped project directory
#    alongside lapis-cv/ (which contains styles/ and fonts/)
```

**Directory structure after download:**

```
lapis-cv-project/
├── .vscode/
│   └── settings.json          # VS Code Markdown preview settings
├── lapis-cv/
│   ├── fonts/                 # Icon fonts, Source Han Sans, JetBrains Mono
│   │   ├── iconfont.ttf
│   │   ├── JetBrainsMono-Regular.ttf
│   │   ├── SourceHanSansCN-Bold.ttf
│   │   ├── SourceHanSansCN-Medium.ttf
│   │   ├── SourceHanSansCN-Regular.ttf
│   │   └── SourceHanSerifCN-Bold.ttf
│   └── styles/
│       ├── lapis-cv.css       # Sans-serif style
│       ├── lapis-cv-serif.css # Serif style
│       └── main.css
├── template-cn.md             # Chinese template
└── template-en.md             # English template
```

**Your resume Markdown file MUST be placed inside this directory** so the CSS and fonts render correctly.

**To export PDF:** Open the Markdown file in VS Code, use Markdown preview (the styles will render automatically), then print to PDF.

**Red Flags — STOP if LapisCV is not downloaded:**
- Writing a resume Markdown file without the LapisCV project directory present
- Only creating a standalone .md file without CSS/fonts
- Forgetting to place the .md file inside the LapisCV project directory

## Complete English Template

```markdown
# FirstName LastName

> <span alt="icon">&#xe60f;</span> `(123)456-7890`&emsp;&emsp; <span alt="icon">&#xe7ca;</span> `email@example.com`&emsp;&emsp; <span alt="icon">&#xe600;</span> [username](https://github.com/username)

<img alt="avatar" src="https://avatars.githubusercontent.com/u/XXXXXXX?v=4">

## &#xe80c; Education

<div alt="entry-title">
    <h3>University Name - Degree - Major</h3>
    <p>Month Year - Month Year</p>
</div>

- **Awards**: Award 1, Award 2
- **Campus Experience**: Role description

## &#xe618; Work Experience

<div alt="entry-title">
    <h3>Job Title - Company, Location</h3>
    <p>Month Year - Month Year</p>
</div>

One-line summary of role and impact.

- **Action verb** + specific achievement + quantified result
- **Action verb** + specific achievement + quantified result

## &#xe635; Projects

<div alt="entry-title">
    <h3>Project Name</h3>
    <a href="https://github.com/user/project">github.com/user/project</a>
</div>

**Project Background:** One sentence explaining the problem context and why the project exists.

**Solution:**
- **Action verb** + specific technical detail + quantified result
- **Action verb** + specific technical detail + quantified result

**Result:** Quantified outcomes — metrics, improvements, deliverables
- **Action verb** + specific technical detail + quantified result

## &#xecfa; Skills

- Category 1: Skill A, Skill B, Skill C
- Category 2: Skill D, Skill E, Skill F
- Category 3: Skill G, Skill H
```

## Complete Chinese Template

```markdown
# 姓名

> <span alt="icon">&#xe60f;</span> `(123)456-7890`&emsp;&emsp;
> <span alt="icon">&#xe7ca;</span> `email@example.com`&emsp;&emsp;
> <span alt="icon">&#xe600;</span> [username](https://github.com/username)

<img alt="avatar" src="https://avatars.githubusercontent.com/u/XXXXXXX?v=4">

## &#xe80c; 教育经历

<div alt="entry-title">
    <h3>学校名称 - 学历 - 专业</h3>
    <p>YYYY.MM - YYYY.MM</p>
</div>

- **奖项**： 奖项1，奖项2
- **校园经历**： 角色描述

## &#xe618; 工作经验

<div alt="entry-title">
    <h3>职位 - 公司</h3>
    <p>YYYY.MM - YYYY.MM</p>
</div>

一句话概述职责和影响力。

- **动词** + 具体成就 + 量化结果
- **动词** + 具体成就 + 量化结果

## &#xe635; 项目经历

<div alt="entry-title">
    <h3>项目名称</h3>
    <a href="https://github.com/user/project">github.com/user/project</a>
</div>

**项目背景：** 一句话概述项目要解决的问题和存在意义。

**解决方案：**
- **动词** + 具体技术细节 + 量化结果
- **动词** + 具体技术细节 + 量化结果

**项目成果：** 量化指标 — 性能提升、准确率变化、耗时缩短等
- **动词** + 具体技术细节 + 量化结果

## &#xecfa; 专业技能

- 类别1： 技能A，技能B，技能C
- 类别2： 技能D，技能E，技能F
```

## Icon Mapping

| Icon Code | Usage | Display |
|-----------|-------|---------|
| `&#xe60f;` | Phone | Phone icon before phone number |
| `&#xe7ca;` | Email | Email icon before email address |
| `&#xe600;` | GitHub/Link | Link icon before GitHub URL |
| `&#xe80c;` | Education | Section icon for Education heading |
| `&#xe618;` | Work | Section icon for Work Experience heading |
| `&#xe635;` | Projects | Section icon for Projects heading |
| `&#xecfa;` | Skills | Section icon for Skills heading |

**Icon usage in contact bar:** Wrap in `<span alt="icon">&#xeXXXX;</span>`
**Icon usage in section headers:** Append after `## ` (e.g., `## &#xe80c; Education`)

## Format Specification

### Header Section
- `h1` = Full name (renders centered, 16pt)
- `blockquote` = Contact information bar (renders centered, 9.5pt)
  - Each contact item: icon + content, separated by `&emsp;&emsp;`
  - Phone numbers in backticks: `` `phone` ``
  - Email in backticks: `` `email` ``
  - URLs as Markdown links: `[text](url)`
- `img alt="avatar"` = Profile photo (optional)
  - Circular crop, right-aligned
  - Source: URL or local path

### Section Headers
- Each section: `h2` + icon prefix + section name
- Renders with accent color underline
- Standard sections: Education, Work Experience, Projects, Skills

### Entry Title Row
```html
<div alt="entry-title">
    <h3>Title - Subtitle</h3>
    <p>Date Range</p>
</div>
```
- Renders as flex layout: title left, date right
- Use `h3` for title text, `p` for date
- For projects, use `a` tag instead of `p` for the right side (project link)

### Bullet Points
- Standard Markdown `- ` bullets
- Bold the category/label: `- **Category**: content`
- Each bullet should be one impactful line

### Page Break
- `---` (horizontal rule) creates a page break in print/PDF

### Date Format
- English: `Month Year - Month Year` (e.g., `Sept 2023 - June 2025`)
- Chinese: `YYYY.MM - YYYY.MM` (e.g., `2023.09 - 2025.06`)
- Present: `Month Year - Present` or `YYYY.MM - 至今`

## CSS Custom Variables

| Variable | Default | Purpose |
|----------|---------|---------|
| `--text-size` | 10pt | Body text size |
| `--line-height` | 1.8 | Line height |
| `--avatar-width` | 28mm | Avatar diameter |
| `--h1-size` | 16pt | Name size |
| `--h2-size` | 12pt | Section header size |
| `--h3-size` | 10.5pt | Entry title size |
| `--blockquote-size` | 9.5pt | Contact bar size |
| `--color-accent` | #00327dac | Accent color (headings, icons, links) |
| `--text-normal` | #353a42 | Body text color |
| `--border-color` | #dae3ea | Border and divider color |

**Serif variant:** Replace `--title-font` with `'SourceHanSerifCN'` and adjust `--color-accent` to `#4870ad`.

## Bullet Point Writing Rules

**Every bullet point MUST follow this structure:**

```
- **Strong verb** + what you did + specific detail + quantified result
```

**Strong verbs:** Led, Designed, Implemented, Optimized, Reduced, Increased, Built, Deployed, Automated, Migrated, Architected, Delivered, Solved, Refactored, Integrated

**Forbidden weak verbs:** Worked on, Helped with, Was responsible for, Participated in, Assisted with, Involved in

**Quantification rules:**
- Every bullet SHOULD include at least one number (percentage, count, time, size)
- If no number is available from the project, describe the specific technical challenge instead
- Never fabricate numbers — if the user didn't mention a metric and you can't derive one from the code, use qualitative specificity instead

**Examples:**

```
- **Implemented** JWT authentication with bcrypt password hashing, reducing auth flow latency from 12.8s to 2.3s
- **Designed** microservice architecture handling 10K+ concurrent WebSocket connections with Redis pub/sub
- **Optimized** database query performance by adding composite indexes, reducing P99 latency from 800ms to 120ms
```
