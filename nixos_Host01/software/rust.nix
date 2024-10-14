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
      # Tauri
      at-spi2-atk
      atkmm
      cairo
      gdk-pixbuf
      glib
      gobject-introspection
      gobject-introspection.dev
      gtk3
      harfbuzz
      librsvg
      libsoup_3
      pango
      webkitgtk_4_1
      webkitgtk_4_1.dev
    ];
  };
}