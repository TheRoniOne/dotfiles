{ config, inputs, ... }:
{
  flake.homeConfigurations.Roni = inputs.home-manager.lib.homeManagerConfiguration {
    pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
    modules = [
      config.flake.modules.homeManager.default
      {
        home = {
          username = "Roni";
          homeDirectory = "/home/Roni";
          stateVersion = "26.05";
        };

        programs.home-manager.enable = true;
        targets.genericLinux.enable = true;
        xdg.enable = true;
      }
    ];
  };
}
