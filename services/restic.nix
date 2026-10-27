{ pkgs, ... }:
{
  services.restic.backups.media = {
    initialize = true;
    repository = "rclone:gdrive-encrypted:";

    rcloneConfigFile = "/home/vagelo/.config/rclone/rclone.conf";
    passwordFile = "/home/vagelo/test.txt";

    paths = [
      "/home/vagelo/app/media"
    ];

    timerConfig = {
      OnCalendar = "*-*-* 16:26:00";
      Persistent = true;
    };

    pruneOpts = [
      "--keep-daily 7"
      "--keep-weekly 4"
      "--keep-monthly 12"
    ];

    backupPrepareCommand = ''
      ${pkgs.docker}/bin/docker compose -f /home/vagelo/app/media/docker-compose.yml down
    '';

    backupCleanupCommand = ''
      ${pkgs.docker}/bin/docker compose -f /home/vagelo/app/media/docker-compose.yml up -d
    '';

    # Rootless
    user = "vagelo";

    #package = pkgs.writeShellScriptBin "restic" ''
    #  exec /run/wrappers/bin/restic "$@"
    #'';
  };

  systemd.services.restic-backups-media = {
    environment = {
      DOCKER_HOST = "unix:///run/user/1000/docker.sock";
    };
  };
  #users = {
  #  users.restic = {
  #    group = "restic";
  #    isSystemUser = true;
  #  };
  #  groups.restic = { };
  #};

  #security.wrappers.restic = {
  #  source = lib.getExe pkgs.restic;
  #  owner = "restic";
  #  group = "restic";
  #  permissions = "500"; # or u=rx,g=,o=
  #  capabilities = "cap_dac_read_search+ep";
  #};
}
