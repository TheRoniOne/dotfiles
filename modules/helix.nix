{
  flake.modules.homeManager.default =
    { pkgs, ... }:
    {
      programs.helix = {
        enable = true;
        extraPackages = [ pkgs.rust-analyzer ];
        settings = {
          theme = "catppuccin_mocha";
          editor.cursor-shape = {
            insert = "bar";
            normal = "block";
            select = "underline";
          };
        };
        languages.language-server.rust-analyzer.config = {
          check.command = "clippy";
          cargo.features = "all";
        };
      };
    };
}
