---
name: feature-benchmark
description: "Benchmark how other products solve one specific problem, at the feature-definition stage. Use whenever competitive research on a feature or user problem is needed: \"benchmark competitors\", \"how do others solve X\", \"competitive study\", \"product research on this problem\", or when a use case calls for enriching an existing benchmark with indirect and cross-industry references."
---

# Feature benchmark

Produce a rigorous benchmark of how other products solve **one specific problem**, to inform the design of a feature. The goal is not to copy but to understand the landscape well enough to make a deliberate choice: align, differentiate, or ignore.

**The principle that governs everything else: the problem matters, not the market.** Any product tackling a similar problem with similar mechanisms is relevant, even in a completely different industry. Size, market and business model never disqualify a reference.

## Inputs

Three things are required. If one is missing, ask before starting:

1. **The product** the benchmark is for.
2. **The specific problem** — not "trust" but "getting a stranger into a car"; not "onboarding" but "making a new driver's first trip succeed". If the stated problem is too broad, narrow it with the user before searching.
3. **The market** — geography and segment.

Then ask, in a single AskUserQuestion call:

- **The output language** — always ask, never assume. This skill is written in English; the deliverable is written in whatever language the user names.
- Depth: ~10-13 detailed references (default), a broad short survey, or 5-6 in great depth.
- Whether a benchmark already exists for this product — if so, read it first and **do not repeat** its references. The new document complements and, where research contradicts it, **corrects** it.

Create a task list up front (framing → research → writing → HTML → verification).

## Step 0 — Frame the problem before searching (mandatory)

Before any research, break the problem into **breaking points**: the successive moments where the user can drop out. For each, name what fails and **who carries the risk**.

This grid is used twice: it structures the research (search for mechanisms per moment, not for products in general), and every reference is then explicitly tied to the moment it addresses. A benchmark without this framing produces a list of features; with it, it produces decisions.

State explicitly what the headline number **does not** say — typically, where it breaks. And say that until that is settled with data, picking a mechanism is a bet. That is the document's honest limit, and it belongs at the front.

## Step 1 — Choose the references

Aim for roughly a dozen references across three families:

- **Direct competitors** — same kind of product, same market.
- **Indirect competitors** — a different kind of product solving the same need, or the same product in a different market. Include **non-consumption**: doing nothing, doing it yourself, doing it off-platform. It is often the number-one competitor and almost always the forgotten one.
- **Cross-industry references** — other sectors facing a structurally identical problem. For a feature benchmark these are worth as much as the direct ones, often more.

Deliberately look outside software: education and training, healthcare, safety, video games, sport, public sector, academic research. The strongest analogies come from there, and they often carry the only clean experimental figures in the file.

Include at least one **counter-example**: a product that handles the problem badly. What it gets wrong becomes a test to apply to your own ideas.

Single selection criterion: *does this product tackle a similar problem, with a mechanism worth borrowing from?*

## Step 2 — Research, in parallel

Launch 2-3 research subagents **in parallel** (one message, several calls), grouped by family. Each agent prompt must:

- name the mechanisms to verify, and explicitly ask the agent to **correct** anything that does not exist or has changed;
- require, for every point, either **VERIFIED (with URL)** or **NOT VERIFIED / reconstruction**;
- forbid invented figures: "if you cannot find a reliable number, write 'no public figure found'";
- ask for platform **self-reported** data to be flagged as such (internal, unaudited);
- bound the answer (~1,200-1,800 words, dense, no preamble).

Where to look: the product itself and its real flow; public sources (product pages, pricing, changelogs, help centres, official blogs, press releases); user voice (app stores, G2, Trustpilot, forums); and for cross-industry references, academic literature and public reports.

Third-party SEO blogs and growth "guides" are a recurring source of error: many widely repeated mechanisms exist in no primary source. They are **removed, not softened** — and the fact that they were discarded goes in the limitations section.

Where the context allows, create an account on the direct products and go as far as the payment screen: it is the only way to see the exact moment each one reassures. If that was not done, write it in the limitations as "the missing verification".

## Step 3 — Write one entry per reference

Words, never a numeric score or stars. Each entry contains:

1. **Their answer to the problem** — one sentence up front summarising the mechanism.
2. **The facts** — 3 to 5 labelled lines (mechanism, money, trade-off, safety net, what is unknown). Useful angles: functionality, user experience, positioning and target, pricing and packaging.
3. **What is clever** — the idea behind the mechanism, not a restatement of it.
4. **What it tells us** — the transposition to the product, tied to a specific moment from the Step 0 grid. Without this section the entry is useless.
5. **Sources** — verified URLs, at the end of the entry.

Always name a mechanism's price, not just its benefit: what it costs, who carries it, what it constrains.

## Step 4 — The synthesis, which is the real deliverable

1. **Group the mechanisms into families** (5 to 7) in a table: mechanism → who does it → what it would look like for us → **implementation cost**. Sort **by ascending cost**, not by assumed impact: cost is what decides what gets tested first.
2. **The "so what"** — 3 to 5 takeaways, each with a clear stance: *idea to adapt*, *gap to close*, or *deliberate non-choice*.
3. **Flag the 2-3 strongest mechanisms**, so the user knows what to lead with in a presentation.
4. **The next test** — 2 to 4 concrete questions to ask users, each with what it settles.
5. **What is not in this document** — the known holes, written down so they are not discovered in the meeting.
6. **A glossary** — every piece of jargon used (cold start, activation, retention, churn, top-up, escrow…) defined in one plain sentence, in the deliverable's language, and every calculation spelled out.

A strong takeaway looks like this: it sets what the product does today against what another sector has **measured**, and it ends in an action. A takeaway that could appear in any benchmark needs rewriting.

## Step 5 — Deliverables

Always produce both:

**1. The markdown** — the full document, structured as above, delivered with SendUserFile.

**2. A tabbed HTML page** — self-contained, published as an artifact and also delivered as a file. Constraints:

- **Horizontal tab navigation**, never one long scrolling page. One tab per section: framing / family 1 / family 2 / synthesis / glossary & limitations.
- In tabs holding several references, a **master list on the left and a detail panel on the right** — not a stack.
- **Keyboard navigation**: ← → between tabs, ↑ ↓ between references. Show the hint on the page.
- Light and dark themes both defined through tokens; all CSS and JS inline; no libraries.
- Load the `artifact-design` skill before writing the page, and ground the visual identity in the subject rather than in a template.

Then offer — without doing it unprompted — to push the document to Notion (inside a collapsible heading, leaving existing content untouched) or to save it to the Claude project.

## Guardrails

- **Verify everything.** Product names, features and facts must be confirmed on the product or a reliable source. What cannot be confirmed is not included. Never present an unverified claim as fact.
- **Distinguish levels of evidence** in the text itself: official source, self-reported unaudited figure, independent study, contested result. When two serious sources disagree, say so.
- **Presence is a signal, not an instruction.** A competitor having a feature does not mean it should be built: it may be a test, a failure, or barely used.
- **A benchmark informs, it does not dictate.** The goal is not feature-by-feature parity, it is distinctive value for your own users.
- **Stay on the problem at hand**, not on the competitor's whole company.
- **Flag what is unknown** — hypotheses and gaps rather than assumptions.
- **Correct errors already present** in the team's documents when research contradicts them, and say so clearly rather than letting two versions coexist.

## Tone

Short sentences, concrete verbs, no superlatives. No "it is interesting to note that". The reader is a busy PM who must be able to defend every line in a review: each claim carries either a source, or an explicit note that it has none.