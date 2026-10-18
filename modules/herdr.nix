{
  flake.modules.homeManager.default =
    { pkgs, ... }:
    {
      xdg.configFile."herdr/config.toml".source = (pkgs.formats.toml { }).generate "herdr-config.toml" {
        onboarding = false;
        terminal.default_shell = "${pkgs.zsh}/bin/zsh";
      };
    };
}
