{
  flake.modules.homeManager.default =
    { pkgs, ... }:
    {
      home.packages = [ pkgs.jetbrains-mono ];
      fonts.fontconfig.enable = true;

      programs.zed-editor = {
        enable = true;
        mutableUserSettings = false;
        extensions = [ "catppuccin" ];
        userSettings = {
          ui_font_size = 14;
          ui_font_family = "JetBrains Mono";
          buffer_font_size = 14;
          buffer_font_family = "JetBrains Mono";
          theme = {
            mode = "system";
            light = "One Light";
            dark = "Catppuccin Mocha";
          };
          autosave = "on_focus_change";
          lsp.rust-analyzer.initialization_options.check.command = "clippy";
          languages.Python.language_servers = [
            "ty"
            "!basedpyright"
            "..."
          ];
        };
      };
    };
}
