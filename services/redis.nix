{
  services.redis = {
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
