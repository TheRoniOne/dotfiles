{
  flake.modules.homeManager.default =
    { config, pkgs, ... }:
    {
      home = {
        packages = with pkgs; [
          fastfetch
          keychain
          pnpm
        ];
        sessionVariables.PNPM_HOME = "${config.home.homeDirectory}/.local/share/pnpm";
        sessionPath = [
          "${config.home.homeDirectory}/bin"
          "/usr/local/bin"
          "${config.home.homeDirectory}/.local/bin"
          config.home.sessionVariables.PNPM_HOME
        ];
      };

      programs.zsh = {
        enable = true;
        dotDir = config.home.homeDirectory;
        autosuggestion.enable = true;
        syntaxHighlighting.enable = true;
        oh-my-zsh = {
          enable = true;
          theme = "robbyrussell";
          plugins = [ "git" ];
          extraConfig = ''
            DISABLE_MAGIC_FUNCTIONS="true"
          '';
        };
        initContent = ''
          path+=("$HOME/.cargo/bin" "$HOME/.opencode/bin")
          eval "$(keychain --eval --quiet id_ed25519)"
          fastfetch
        '';
      };

      programs.zoxide = {
        enable = true;
        enableZshIntegration = true;
      };
    };
}
