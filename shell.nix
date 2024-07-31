with import <nixpkgs> { };

stdenv.mkDerivation {
  name = "rust-env";
  nativeBuildInputs = [
    pkgs.rustc
    pkgs.cargo
  ];

  packages = [
    pkgs.solana-cli
  ];

  # Set Environment Variables
  RUST_BACKTRACE = 1;

  shellHook = ''
    cargo install ore-cli@1.0.0-alpha.6
  '';
}
