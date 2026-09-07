# Generate empty PII stubs (public build).
pii:
    test -f pii_en.typ || printf '#let pii-address = ""\n#let pii-phone = ""\n#let pii-email = ""\n' > pii_en.typ
    test -f pii_de.typ || printf '#let pii-address = ""\n#let pii-phone = ""\n#let pii-email = ""\n' > pii_de.typ

build: pii
    typst compile cv_en.typ cv_en.pdf
    typst compile cv_de.typ cv_de.pdf

build-en: pii
    typst compile cv_en.typ cv_en.pdf

build-de: pii
    typst compile cv_de.typ cv_de.pdf

fmt:
    typstyle -i cv_en.typ cv_de.typ

clean:
    rm -f cv_en.pdf cv_de.pdf
