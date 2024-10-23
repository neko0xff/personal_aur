{ config, pkgs, ... }:

{
  environment = {
    systemPackages = with pkgs; [
      corepack
      deno
      nodePackages.pnpm
      nodejs
      bun
      protobuf
      grpc-tools
      protoc-gen-grpc-web
      esbuild
      zap
      wireshark
    ];
  };
}