# Interview Question Bank

Question templates and evaluation criteria for mock interviews. Use these as frameworks for generating resume-specific deep-dive questions.

**Core principle:** These are TEMPLATES, not canned questions. Every question must be customized to the user's actual resume content. The deep-dive method probes each project from surface to depth across multiple topic layers.

## Deep-Dive Topic Templates

### Topic Layer 1: Background & Role Boundary

These questions establish whether the candidate truly understands the project context and can articulate their personal contribution.

| Question Template | What It Probes |
|------------------|---------------|
| What specific problem does [project] solve? What pain existed before? | Understanding of project purpose |
| What was the traditional approach? Why was it insufficient? | Understanding of motivation |
| What specifically did YOU do vs. the team? Data, training, RAG, tools, evaluation — which parts? | Role clarity and ownership |
| Which capabilities came from the model itself vs. RAG/Tool/rules system? | System architecture understanding |
| What was the project's deployment status — offline, gray release, or production? | Real-world impact awareness |
| If the interviewer gives you 2 minutes, can you explain the complete chain? | Communication and synthesis ability |

**Good answer signals:** Clear problem statement, specific personal contribution, awareness of system boundaries.
**Bad answer signals:** Vague "we built X", unclear role boundary, can't articulate why the project was needed.

### Topic Layer 2: Architecture & Design Decisions

These questions probe whether the candidate understands WHY, not just WHAT.

| Question Template | What It Probes |
|------------------|---------------|
| Why did you choose [approach] over [alternatives]? | Design reasoning |
| What trade-offs did you make? What did you give up? | Trade-off awareness |
| What would break if [metric/users/data] increased 10x? | Scalability thinking |
| Walk me through how a request travels through the system end-to-end | System-level understanding |
| What are the current bottlenecks? How would you address them? | Self-awareness and improvement thinking |
| How did you decide between [option A] and [option B]? | Decision-making under uncertainty |

**Good answer signals:** Discusses multiple alternatives, explains reasoning, acknowledges limitations.
**Bad answer signals:** States choice without reasoning, can't name alternatives, no awareness of limitations.

### Topic Layer 3: Data & Training (for ML/AI Projects)

These questions probe whether the candidate understands the full data and training lifecycle.

| Question Template | What It Probes |
|------------------|---------------|
| Where did the training data come from? How was it collected? | Data provenance |
| How was data labeled? Who labeled it? How was label quality ensured? | Data quality |
| How many training samples? Train/val/test split? Positive/negative ratio? | Data scale awareness |
| What does each training sample contain? How are inputs and outputs structured? | Data format understanding |
| How do you handle class imbalance? | Data engineering |
| What loss mask strategy did you use? Which tokens have loss? | Training mechanics |
| What training hyperparameters? (lr, batch size, epochs, max length) | Training configuration |
| How did you determine LoRA rank/alpha/dropout? | Hyperparameter reasoning |
| bf16, fp16, or fp32? Why? | Numerical precision understanding |
| How did you prevent data leakage between train and test? | ML rigor |

**Good answer signals:** Specific numbers, awareness of data quality issues, understanding of loss mask mechanics.
**Bad answer signals:** "I don't remember the exact numbers", no awareness of class imbalance, can't explain loss mask.

### Topic Layer 4: Technical Internals

These questions probe deep understanding of specific technologies claimed in the resume.

| Question Template | What It Probes |
|------------------|---------------|
| How does [component X] work internally? | Internal mechanism understanding |
| What happens when [component X] fails? | Failure mode awareness |
| What are the alternatives to [component X]? Why this one? | Design choice justification |
| How does [component X] interact with [component Y]? | System integration understanding |
| Can you write/explain the core formula for [algorithm]? | Mathematical foundation |
| How is [component X] implemented? Not the API, the internals. | Below-the-API understanding |

**ML/AI Specific Internals:**

| Topic | Deep-Dive Questions |
|-------|-------------------|
| Transformer | Attention formula? Why divide by sqrt(d_k)? MHA vs MQA vs GQA? |
| RoPE | Where is it applied? Why on Q/K not V? What happens with long context? |
| LoRA | Core formula? Why B initialized to 0? How to merge weights? How to verify effectiveness? |
| RAG | Chunking strategy? Embedding model? Why reranker after vector recall? Top-K reasoning? |
| Tool Calling | How does the model know which tool to call? What if the tool fails? How to prevent model from fabricating observations? |
| SFT Loss Mask | Which tokens have loss? System/user/assistant/tool call/tool observation? Why? |
| DPO vs PPO | Data format difference? Reference model role? Why DPO is simpler? |
| KV Cache | What is cached? Why not cache Query? Why it speeds up decode but doesn't change attention's length dependency? |
| FlashAttention | Why does it save memory? Is it approximate? What's the core optimization? |

**Good answer signals:** Can explain internals, not just API usage. Can write core formulas. Can discuss trade-offs.
**Bad answer signals:** Only knows the API. Can't explain WHY. Recites documentation without understanding.

### Topic Layer 5: Evaluation & Metrics

These questions probe whether the candidate can rigorously evaluate their own work.

| Question Template | What It Probes |
|------------------|---------------|
| How do you define [metric]? Specifically, what counts as correct? | Metric definition rigor |
| How large is the test set? Who labeled it? | Evaluation reliability |
| Do you measure precision, recall, F1? Which matters more for your use case? | Metric awareness |
| How do you do ablation? Prompt only → +RAG → +LoRA → full pipeline? | Scientific evaluation |
| If the model makes an error, how do you trace which module caused it? | Debug methodology |
| How do you monitor quality degradation in production? | Production awareness |

**Good answer signals:** Specific metric definitions, ablation methodology, Bad Case analysis, error tracing by module.
**Bad answer signals:** "Accuracy went up" without definition, no ablation, can't trace errors to specific modules.

### Topic Layer 6: Failure Modes & Improvement

These questions probe self-awareness and improvement ability — the most valuable interview signal.

| Question Template | What It Probes |
|------------------|---------------|
| Give me 3 real Bad Cases from this project. | Concrete failure awareness |
| What went wrong? Which module caused it — retrieval, reranking, model, or prompt? | Error attribution |
| How did you fix each Bad Case? Did you update RAG, change prompt, retrain, or add rules? | Fix methodology |
| Has the model ever been overly conservative (e.g., flagging everything as high risk)? | Failure mode awareness |
| Has the model ever referenced irrelevant evidence? | Quality awareness |
| If [metric] improves but human evaluation degrades, how do you investigate? | Metric-audit alignment |
| What would you do differently if you started over? | Reflective thinking |

**Good answer signals:** Can name specific Bad Cases with root causes, traces errors to specific modules, has improvement methodology.
**Bad answer signals:** "It worked well overall", can't name specific failures, attributes all errors to "the model" without module-level tracing.

### Topic Layer 7: Elevator Pitch

The 2-minute pitch test — can the candidate explain the complete system chain concisely?

**Why this matters:** In real interviews, "tell me about this project in 2 minutes" is the most common opening question. Candidates who can't articulate the full chain lose the interviewer immediately.

**What a good pitch includes (in 2 minutes):**
1. What problem existed (1-2 sentences)
2. What the system does end-to-end (2-3 sentences)
3. Key technical decisions and why (2-3 sentences)
4. Results with metrics (1-2 sentences)
5. What you personally did (1-2 sentences)

**What a bad pitch sounds like:**
- Starts with "we used X, Y, Z" (technology list, no narrative)
- Can't explain the complete chain in under 5 minutes
- Mixes up what the team did vs. what they did
- Has no metrics or results
- Doesn't explain WHY any decisions were made

## High-Risk Rapid-Fire Templates

After deep-diving each project, use these rapid-fire question sets to test consistency and catch gaps:

### For LoRA/Fine-tuning Projects

1. How many cards did you use? What model?
2. How many training samples? Why is that enough?
3. Why LoRA rank [N]? What happens if rank is too small/large?
4. Which layers did you attach LoRA to? Why those?
5. How do you prove LoRA actually helped vs. prompt/RAG?
6. Did you do ablation? Prompt-only vs. +RAG vs. +LoRA vs. full?
7. Online effect vs. offline evaluation — are they consistent?

### For RAG/Retrieval Projects

1. What embedding model? Did you fine-tune it?
2. Chunk size? Why?
3. Top-K? Why that number?
4. Why reranker after vector recall?
5. How do you handle irrelevant retrieved evidence?
6. How do you trace retrieval errors vs. model errors?
7. RAG update frequency? How do new samples get ingested?

### For Agent/Tool-Calling Projects

1. What tools does the agent have? Schema design?
2. How does the model decide when to call tools? Prompt, SFT, or routing?
3. What if tool call fails? Retry strategy?
4. How do you prevent the model from fabricating tool observations?
5. How do you evaluate tool calling quality beyond final answer?
6. Tool calling order — fixed workflow or model-planned?
7. How do you control tool calling cost and latency?

### For Training Engineering

1. Training loss vs. eval loss divergence — what does it mean?
2. Loss spikes / NaN — what to check?
3. bf16 vs. fp16 vs. fp32 — when and why?
4. Gradient accumulation — how does it simulate large batch?
5. OOM troubleshooting sequence?
6. How to save checkpoint? How to resume training?
7. How to detect overfitting?

## Question Customization Rules

**Every question MUST be customized to the resume.** These templates are starting points.

### Customization Process

1. **Read the resume** — Identify project names, technologies, and claimed achievements
2. **Extract specifics** — For each project, list: tech stack, architecture, quantified results, role
3. **Fill templates** — Replace `[technology]`, `[project name]`, etc. with actual resume content
4. **Verify relevance** — Every question should be impossible to answer without knowledge of THAT specific project
5. **Add follow-up probes** — For each question, prepare at least one follow-up that goes one level deeper

### Bad vs Good Customization

**Bad (generic):**
> "Tell me about your experience with RAG."

**Good (resume-specific):**
> "Your ChangeAgent project uses RAG for risk case retrieval. How did you design the chunking strategy for configuration diffs? Why 300 characters per chunk?"

**Bad (generic):**
> "How does LoRA work?"

**Good (resume-specific):**
> "You used LoRA on DeepSeek-V3 for domain adaptation in ChangeAgent. Which layers did you attach LoRA to? Why those specifically? How would you do ablation to prove LoRA helped?"

**Bad (generic):**
> "What was a challenge you faced?"

**Good (resume-specific):**
> "In your ChangeAgent project, risk accuracy improved from 50% to 70%. When the model made errors, how did you trace whether the issue was in RAG retrieval, reranking, or model generation? Walk me through your error attribution process."

## Evaluation Criteria by Answer Depth

| Depth Level | Signal | Example |
|-------------|--------|---------|
| **Level 0: Can't answer** | Fundamental gap | Doesn't know what loss mask is |
| **Level 1: Knows the concept** | Surface understanding | "Loss mask controls which tokens have loss" |
| **Level 2: Can explain mechanism** | Working knowledge | "System/user tokens don't have loss, assistant tokens do" |
| **Level 3: Can explain reasoning** | Deep understanding | "Tool call tokens have loss because model must learn when to call; tool observations don't because they're external results" |
| **Level 4: Can discuss trade-offs** | Expert understanding | "Whether to include thought tokens in loss depends on whether you want to supervise the reasoning process" |
| **Level 5: Can relate to project specifics** | Production understanding | "In ChangeAgent, we mask everything except the structured risk report JSON, because that's what we want the model to generate" |

**Target for strong candidates:** Level 3+ on all topics, Level 4+ on core technologies, Level 5 on their own project.

## Knowledge Gap Detection Signals

| Answer Pattern | Likely Gap | Recommended Resource |
|---------------|-----------|---------------------|
| Can't explain how a technology works internally | Surface-level understanding | Official documentation, source code reading |
| Mentions technology but can't describe trade-offs | Chose by convention, not reasoning | Architecture blog posts, comparison articles |
| Can't identify bottlenecks or failure modes | No production thinking | System design primers, post-mortem readings |
| Gives only happy-path explanations | No failure handling experience | Chaos engineering resources, error handling patterns |
| Uses "we" exclusively, never "I" | Possible lack of ownership or individual contribution | Practice STAR stories with personal pronouns |
| Can't quantify impact | No metrics awareness | Practice estimating: users, requests, data sizes, latencies |
| Stuck at API level, can't go deeper | Framework user, not framework understander | Build something from scratch without the framework |
| Describes what but not why | Implementation without reasoning | Practice explaining decisions with "because" |
| No alternative considered | Single-solution thinking | Read architecture decision records (ADRs) |
| "不清楚" / "not sure" on training details | Didn't track or record training configuration | Build habit of logging all training configs and results |
| Can't trace errors to specific modules | Monolithic debugging, no modular thinking | Practice error attribution: retrieval vs. reranking vs. model vs. prompt |
| Knows formula but can't connect to project | Theoretical knowledge without practical application | Re-implement core components in the project context |
| Can't give a 2-minute pitch | Haven't practiced articulation | Write and practice a pitch for each project |
