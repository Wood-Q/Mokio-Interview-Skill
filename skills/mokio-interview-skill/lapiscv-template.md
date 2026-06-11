# LapisCV Template Reference

LapisCV v2.x Markdown template format for VS Code. All resume output MUST comply with this specification.

## ⚠️ MANDATORY: Setup LapisCV Before Creating Resumes

LapisCV is NOT just a Markdown format — it includes CSS stylesheets, fonts, and VS Code settings required for proper rendering and PDF export. You MUST copy the LapisCV assets before writing any resume.

**Copy LapisCV assets to the current working directory (flat, not into a subdirectory):**

```bash
# Copy from skill assets to working directory
# SKILL_DIR = the directory where this skill is installed
cp -r "${SKILL_DIR}/assets/lapis-cv-vscode-v2.0.1/.vscode" ./
cp -r "${SKILL_DIR}/assets/lapis-cv-vscode-v2.0.1/lapis-cv" ./
```

**Why flat copy?** `.vscode/settings.json` references `./lapis-cv/styles/...` via relative paths. The resume .md file must be at the same directory level as `lapis-cv/` and `.vscode/` for CSS to load correctly in VS Code Markdown preview.

**Directory structure after copy:**

```
./                              ← Current working directory
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
└── your-resume.md             # ← Your resume goes here
```

**To export PDF:** Open the .md in VS Code → Markdown Preview (styles render automatically) → Print to PDF.

**Red Flags — STOP if LapisCV assets are not present:**
- Writing a resume .md file without `lapis-cv/styles/` and `lapis-cv/fonts/` in the same directory
- Placing the resume in a subdirectory (CSS relative paths will break)
- Forgetting to copy `.vscode/settings.json` (preview won't load styles)

## Authoritative Templates

The authoritative LapisCV templates are in the skill's assets directory. **Always read these files directly** when generating a resume — they define the exact format, icon usage, and structure.

| Template | Path | Language |
|----------|------|----------|
| Chinese | `assets/lapis-cv-vscode-v2.0.1/template-cn.md` | 中文简历 |
| English | `assets/lapis-cv-vscode-v2.0.1/template-en.md` | English resume |

**When generating a resume:**
1. Read the appropriate template file from assets
2. Copy its structure exactly — icon codes, `<span class="icon">` vs `<span alt="icon">`, `div` attributes, `blockquote` formatting
3. Replace placeholder content with the user's information
4. Do NOT invent format details from memory — always check the actual template

**Key differences between Chinese and English templates:**

| Element | Chinese (`template-cn.md`) | English (`template-en.md`) |
|---------|---------------------------|---------------------------|
| Contact icons | `<span class="icon">` | `<span alt="icon">` |
| Contact layout | Each item on separate `>` line | All items on one `>` line |
| Education format | `学校 - 学历 - 专业` in `h3` | `University Name` in `h3`, degree below |
| Date format | `YYYY.MM - YYYY.MM` | `Month Year - Month Year` |
| Section names | 教育经历、工作经验、项目经历、专业技能 | Education, Work Experience, Projects, Skills |

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
