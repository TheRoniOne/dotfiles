{
  flake.modules.homeManager.default.programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      add_newline = false;
      line_break.disabled = true;
    };
  };
}
