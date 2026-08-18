{ pkgs, ...}:
{
  services.n8n = {
    enable = true;
    environment = {
      N8N_RUNNERS_AUTH_TOKEN_FILE = "/home/vagelo/auth-n8n.txt";
      NODE_FUNCTION_ALLOW_EXTERNAL = "sqlite,csv-parse,fs,cheerio";
      GENERIC_TIMEZONE = "Europe/Moscow";
    };
    taskRunners = {
      enable = true;
      environment = {
        N8N_RUNNERS_EXTERNAL_ALLOW = "requests";
      };
      runners.python = {
        enable = true;
        command = let
          myPython = pkgs.python3.withPackages (ps: with ps; [
            requests
          ]);
        in "${myPython}/bin/python";
      };
    };
  };

}
