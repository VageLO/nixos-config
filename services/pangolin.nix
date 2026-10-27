{ pkgs, ... }:

{
  services.newt = {
    enable = true;
    environmentFile = "/home/vagelo/newt.env";
    settings = {
      endpoint = "https://app.pangolin.net";
    };
  };
}
