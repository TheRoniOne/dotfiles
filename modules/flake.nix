{ config, inputs, ... }:
{
  imports = [ inputs.flake-parts.flakeModules.modules ];

  systems = [ "x86_64-linux" ];

  perSystem =
    { system, ... }:
    {
      packages.home-manager = inputs.home-manager.packages.${system}.home-manager;
      checks.home = config.flake.homeConfigurations.Roni.activationPackage;
    };
}
