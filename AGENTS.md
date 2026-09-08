# CV — Agent Rules

Bilingual (de/en) CV. Public build = empty PII stubs; full build = sops.

## Workflow

1. Load the `typst-author` skill before writing Typst syntax from memory.
2. Validation loop: `just build` after every edit; fix errors before done.
3. `just fmt` (typstyle) before finishing.

## PII rules (critical)

- Real personal data exists ONLY in `secrets/pii.yaml` (sops-encrypted).
- `pii_en.typ` / `pii_de.typ` are GENERATED (gitignored) — never commit real
  values into them; `just pii` regenerates stubs.
- Any PDF built for public distribution must come from the stub build
  (`nix build` / `just build`). Verify no address/phone/email leaks before
  publishing.

## Conventions

- Bilingual variants `cv_de.typ` / `cv_en.typ` share structure; keep both in
  sync when adding sections.
- Repo stays in /per/repos; artifacts (PDFs) are copied out explicitly.
