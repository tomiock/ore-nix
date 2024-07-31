with import <nixpkgs> { };

let
  unstable = import <nixos-unstable> { };
in
stdenv.mkDerivation {
  name = "rust-env";
  buildInputs = [
    unstable.rustPackages.cargo
    unstable.solana-cli
    pkgs.libiconv
  ];

  # Set Environment Variables
  RUST_BACKTRACE = 1;

  shellHook = ''
    cargo install ore-cli@1.0.0-alpha.6
  '';
}
