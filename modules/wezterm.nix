{
  flake.modules.homeManager.default =
    { pkgs, ... }:
    {
      programs.wezterm = {
        enable = true;
        settings = {
          default_prog = [ "${pkgs.zsh}/bin/zsh" ];
          initial_cols = 125;
          initial_rows = 35;
        };
      };
    };
}
