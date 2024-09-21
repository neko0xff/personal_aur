{ config, pkgs, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      # rust
      cargo-cross
      cargo-expand
      cargo-mommy
      cargo-nextest
      cargo-auditable-cargo-wrapper
      rustc
      rustup-toolchain-install-master
      rustfmt
      clippy
      pkg-config
      openssl.dev
      llvmPackages.bintools
      llvmPackages.libcxxStdenv
      llvmPackages.libunwind
      llvmPackages.libcxx
      llvmPackages.clangUseLLVM
      llvmPackages.lld
      llvmPackages.llvm
      tokei
      zlib
      libiconv
      protoc-gen-rust
    ];
  };
}