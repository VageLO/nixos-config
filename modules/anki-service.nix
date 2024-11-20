{ pkgs, ... }:

{
  systemd.user.services.anki = {
    Service = {
      ExecStart = "${pkgs.anki}/bin/anki";
      Restart = "on-failure";
      RestartSec = "5s";
    };
    Install = {
      WantedBy = [ "default.target" ];
    };
  };
}
