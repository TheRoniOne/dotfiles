{
  flake.modules.homeManager.default =
    { pkgs, ... }:
    {
      programs.git = {
        enable = true;
        settings = {
          user = {
            name = "TheRoniOne";
            email = "ronidani99@hotmail.com";
          };
          merge.mergiraf = {
            name = "mergiraf";
            driver = "${pkgs.mergiraf}/bin/mergiraf merge --git %O %A %B -s %S -x %X -y %Y -p %P -l %L";
          };
        };
        attributes = [ "* merge=mergiraf" ];
      };

      home.packages = [ pkgs.mergiraf ];
    };
}
