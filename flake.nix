{
  description = "lapce-nix";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    self,
    nixpkgs,
    flake-utils,
  }:
    flake-utils.lib.eachSystem ["x86_64-linux" "aarch64-linux" "aarch64-darwin"] (
      system: let
        pkgs = import nixpkgs {inherit system;};
      in {
        devShells.default = pkgs.mkShell {
          buildInputs = with pkgs; [
            rustup
            cargo-watch
            cargo-outdated
            cargo-edit
            cargo-audit
            jo
            bacon
            rust-analyzer
            nil
            rustfmt
            # Rust
            # Shells
            nushell
            # to test github actions
            act
            # Tools
            podman
            cargo-make
            cargo-audit
            nixfmt
            cargo-cross
            # Dependencies
            cacert
            openssl
            git
            git-lfs
            mosh
            zlib
            pkg-config
          ];
        };
      }
    );
}
