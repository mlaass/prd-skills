# prd-skills

Three reusable [Claude Code](https://claude.com/claude-code) skills for working with product requirements documents (PRDs):

- **prd-create** — Drafts a new PRD through iterative questioning. Never assumes; asks the user for every design decision and matches the project's existing PRD conventions. Its only deliverable is a written PRD in `docs/` — no code, no implementation plan.
- **prd-review** — Reviews an existing PRD by validating its claims against the actual codebase and presenting findings (errors, gaps, inconsistencies, suggestions) one severity group at a time via `AskUserQuestion`. Never silently fixes — asks first, applies after confirmation.
- **prd-implementation-audit** — Audits whether shipped code actually matches the PRD it promised. Runs the project's validation commands (tests, build, lint, typecheck), cross-checks the git diff against the PRD's file list, and asks the harder question: do the passing tests actually cover what the PRD promised? Language- and framework-agnostic.

## Install

### On the machine where you want to develop these skills

Symlinks the skills into `~/.claude/skills/` so edits in this repo go live immediately:

```bash
git clone https://github.com/mlaass/prd-skills.git
cd prd-skills
./install.sh
```

If a non-symlink directory already exists at the destination (e.g. you have an older copy of the skill), `install.sh` skips it. Pass `--force` to replace.

### On any other machine (snapshot copy)

```bash
git clone https://github.com/mlaass/prd-skills.git
cp -r prd-skills/skills/* ~/.claude/skills/
```

## How Claude Code finds skills

Claude Code auto-discovers any directory matching `~/.claude/skills/<name>/SKILL.md`. The frontmatter `name` becomes the slash command — e.g. `/prd-create`. No registration step.

## Layout

```
skills/
├── prd-create/SKILL.md
├── prd-review/SKILL.md
└── prd-implementation-audit/SKILL.md
```

Each `SKILL.md` is a self-contained prompt with YAML frontmatter (`name`, `description`).

## License

MIT — see [LICENSE](LICENSE).
