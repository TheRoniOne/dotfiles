{
  flake.modules.homeManager.default.xdg.configFile = {
    "xkb/rules/evdev".source = ./rules/evdev;
    "xkb/rules/evdev.xml".source = ./rules/evdev.xml;
    "xkb/symbols/graphite".source = ./symbols/graphite;
  };
}
