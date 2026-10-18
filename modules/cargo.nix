{
  flake.modules.homeManager.default =
    { pkgs, ... }:
    {
      programs.cargo = {
        enable = true;
        settings.target.x86_64-unknown-linux-gnu = {
          linker = "${pkgs.clang}/bin/clang";
          rustflags = [
            "-C"
            "link-arg=--ld-path=${pkgs.wild}/bin/wild"
          ];
        };
      };

      home.packages = with pkgs; [
        rustc
        rustfmt
        clippy
        clang
        wild
      ];
    };
}
