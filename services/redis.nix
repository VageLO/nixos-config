{
  services.redis = {
    enable = true;
    servers = {
      "" = {
        enable = true;
        save = [
          [ 60 1 ]
        ];
      };
    };
  };
}
