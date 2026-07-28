{
  description = "Felix Schausberger's CV — public on GitHub Pages, full version with PII via sops";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    flake-parts.url = "github:hercules-ci/flake-parts";
    systems.url = "github:nix-systems/default";
    treefmt-nix.url = "github:numtide/treefmt-nix";
  };

  outputs =
    inputs:
    inputs.flake-parts.lib.mkFlake { inherit inputs; } {
      systems = import inputs.systems;
      imports = [
        inputs.treefmt-nix.flakeModule
      ];
      perSystem =
        { config, pkgs, ... }:
        {
          packages = {
            public-cv-en = pkgs.stdenv.mkDerivation {
              name = "cv-en-public";
              src = ./.;
              buildInputs = [ pkgs.typst ];
              buildPhase = ''
                cat > pii_en.typ << 'PIEEOF'
                #let pii-address = ""
                #let pii-phone = ""
                #let pii-email = ""
                PIEEOF
                cat > pii_de.typ << 'PIEEOF'
                #let pii-address = ""
                #let pii-phone = ""
                #let pii-email = ""
                PIEEOF
                typst compile cv_en.typ cv_en.pdf
                typst compile cv_de.typ cv_de.pdf
              '';
              installPhase = ''
                mkdir -p $out
                cp cv_en.pdf cv_de.pdf $out/
              '';
            };

            public-cv-de = pkgs.stdenv.mkDerivation {
              name = "cv-de-public";
              src = ./.;
              buildInputs = [ pkgs.typst ];
              buildPhase = ''
                cat > pii_en.typ << 'PIEEOF'
                #let pii-address = ""
                #let pii-phone = ""
                #let pii-email = ""
                PIEEOF
                cat > pii_de.typ << 'PIEEOF'
                #let pii-address = ""
                #let pii-phone = ""
                #let pii-email = ""
                PIEEOF
                typst compile cv_de.typ cv_de.pdf
              '';
              installPhase = ''
                mkdir -p $out
                cp cv_de.pdf $out/
              '';
            };

            full-cv-en = pkgs.stdenv.mkDerivation {
              name = "cv-en-full";
              src = ./.;
              buildInputs = [ pkgs.typst pkgs.sops (pkgs.python3.withPackages (ps: [ ps.pyyaml ])) ];
              buildPhase = ''
                                sops -d secrets/pii.yaml | ${pkgs.python3.withPackages (ps: [ps.pyyaml])}/bin/python3 -c "
                import sys, yaml
                data = yaml.safe_load(sys.stdin)
                for lang, prefix in [('en', 'pii_en'), ('de', 'pii_de')]:
                    d = data.get(lang, {})
                    with open(f'{prefix}.typ', 'w') as f:
                        f.write(f'#let pii-address = \"{d.get(\"address\", \"\")}\"\n')
                        f.write(f'#let pii-phone = \"{d.get(\"phone\", \"\")}\"\n')
                        f.write(f'#let pii-email = \"{d.get(\"email\", \"\")}\"\n')
                "
                                typst compile cv_en.typ cv_en.pdf
              '';
              installPhase = ''
                mkdir -p $out
                cp cv_en.pdf $out/
              '';
            };

            full-cv-de = pkgs.stdenv.mkDerivation {
              name = "cv-de-full";
              src = ./.;
              buildInputs = [ pkgs.typst pkgs.sops (pkgs.python3.withPackages (ps: [ ps.pyyaml ])) ];
              buildPhase = ''
                                sops -d secrets/pii.yaml | ${pkgs.python3.withPackages (ps: [ps.pyyaml])}/bin/python3 -c "
                import sys, yaml
                data = yaml.safe_load(sys.stdin)
                for lang, prefix in [('en', 'pii_en'), ('de', 'pii_de')]:
                    d = data.get(lang, {})
                    with open(f'{prefix}.typ', 'w') as f:
                        f.write(f'#let pii-address = \"{d.get(\"address\", \"\")}\"\n')
                        f.write(f'#let pii-phone = \"{d.get(\"phone\", \"\")}\"\n')
                        f.write(f'#let pii-email = \"{d.get(\"email\", \"\")}\"\n')
                "
                                typst compile cv_de.typ cv_de.pdf
              '';
              installPhase = ''
                mkdir -p $out
                cp cv_de.pdf $out/
              '';
            };

            default = pkgs.symlinkJoin {
              name = "cv-all";
              paths = [
                config.packages.public-cv-en
                config.packages.public-cv-de
              ];
            };
          };

          devShells.default = pkgs.mkShell {
            inputsFrom = [ config.treefmt.build.devShell ];

            shellHook = ''
                            generate_pii() {
                              if command -v sops &>/dev/null && sops -d secrets/pii.yaml &>/dev/null 2>&1; then
                                echo "Generating pii_*.typ from sops secrets..."
                                sops -d secrets/pii.yaml | ${pkgs.python3.withPackages (ps: [ps.pyyaml])}/bin/python3 -c "
              import sys, yaml
              data = yaml.safe_load(sys.stdin)
              for lang in ['en', 'de']:
                  d = data.get(lang, {})
                  with open(f'pii_{lang}.typ', 'w') as f:
                      f.write(f'#let pii-address = \"{d.get(\"address\", \"\")}\"\n')
                      f.write(f'#let pii-phone = \"{d.get(\"phone\", \"\")}\"\n')
                      f.write(f'#let pii-email = \"{d.get(\"email\", \"\")}\"\n')
              "
                                echo "  Done."
                              else
                                echo "No sops key available — generating empty PII stubs for public CV."
                                echo '#let pii-address = ""' > pii_en.typ
                                echo '#let pii-phone = ""' >> pii_en.typ
                                echo '#let pii-email = ""' >> pii_en.typ
                                cp pii_en.typ pii_de.typ
                              fi
                            }
                            generate_pii
            '';

            nativeBuildInputs = with pkgs; [
              typst
              sops
              helix
              just
            ];
          };

          treefmt.config = {
            projectRootFile = "flake.nix";
            programs.nixpkgs-fmt.enable = true;
          };
        };
    };
}
