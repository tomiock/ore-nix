with import <nixpkgs> { };
let
    #rust_channel = pkgs.rust-bin.fromRustupToolchainFile ./rust-toolchain;

    unstableTarball =
        fetchTarball
        "https://github.com/NixOS/nixpkgs/archive/nixos-unstable.tar.gz";
    unstable = import unstableTarball {};
in
pkgs.mkShell {

    inputsFrom = [
        /*
        (rust_channel.override{
            extensions = [ "rust-src" "rust-std" ];
        })
        */

        unstable.rustup
        unstable.cargo
        unstable.rustPackages.cargo
        unstable.solana-cli
        unstable.libiconv
        llvmPackages.clang
    ];

    RUST_BACKTRACE = 1;

    # compilation of -sys packages requires manually setting LIBCLANG_PATH
    LIBCLANG_PATH = "${pkgs.llvmPackages.libclang.lib}/lib";

    shellHock = ''
        echo "hola"
        cargo install ore-cli
    '';
}
