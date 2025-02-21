{ config, pkgs, ... }: 
{
  environment.systemPackages = with pkgs; [
    vscode
    jetbrains.idea-ultimate
    jetbrains.rust-rover
    neovim
    rust-analyzer      # Rust LSP
    taplo              # TOML LSP
    rustup
    lua-language-server
    nil                # Nix LSP
    nixpkgs-fmt        # Formatter for Nix files
    luajit
    gradle
    maven
    python3
    ghc
    docker
    git
    zulu               # Java 21
    texlive.combined.scheme-full
    gcc
    # University tools
    mars-mips          # MIPS assembler
    armips
    
  ];

  virtualisation.docker.enable = true;
}
