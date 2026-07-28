# CV

Felix Schausberger's CV, written in [Typst](https://typst.app).

## Structure

- `cv_en.typ` — English CV (uses `pii_en.typ`)
- `cv_de.typ` — German CV (uses `pii_de.typ`)
- `pii_*.typ` — Generated files containing PII (gitignored)
- `secrets/pii.yaml` — SOPS-encrypted PII (address, phone, email)

The CV is available in two variants:
- **Public**: compiled with empty PII stubs — no address, no phone, no email
- **Full**: compiled with real PII from sops decryption — includes address, phone

## Usage

### Public CV (no PII)

```bash
nix build .#public-cv-en   # or public-cv-de
ls result/
```

Or directly:
```bash
echo '#let pii-address = ""' > pii_en.typ
echo '#let pii-phone = ""' >> pii_en.typ
echo '#let pii-email = ""' >> pii_en.typ
typst compile cv_en.typ
```

### Full CV (with PII)

```bash
nix build .#full-cv-en  # or full-cv-de
```

Or via dev shell:
```bash
nix develop
# pii_*.typ are auto-generated from sops
typst compile cv_en.typ
```

### Dev shell

```bash
nix develop
# Generates pii_*.typ from sops (or empty stubs if no key)
# Then just:
typst compile cv_en.typ
```

## Deploy

GitHub Actions deploys public CVs to GitHub Pages automatically on push to `main`.

## PII

Personally Identifiable Information (address, phone, email) is encrypted with
[sops](https://github.com/getsops/sops) using your age key.

Decryption requires `SOPS_AGE_KEY` in the environment (set automatically by
`.envrc` via `ssh-to-age`).

### Update PII

```bash
sops secrets/pii.yaml   # opens in $EDITOR with decrypted content
```

Then recompile the full CV.
