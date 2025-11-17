{ pkgs, config, ... }:
{
  systemd.services.bsmmex = {
    enable = true;
    description = "bsmmex";
    wantedBy = [ "multi-user.target" ];
    after = [ "network.target" ];
    serviceConfig = {
      ExecStart = "${pkgs.bsmmex}/bin/bsmmex";
      Restart = "always";
      User = "vagelo";
      Group = "users";
    };
    environment = {
      BSFOLDER="${config.users.users.vagelo.home}/Workflow/statements";
      MMEXFILE="${config.users.users.vagelo.home}/Workflow/mmex.mmb";
    };
  };
}
