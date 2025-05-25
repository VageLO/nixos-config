{
  services.prometheus = {
    enable = true;
    scrapeConfigs = [
      {
        job_name = "blocky";
        static_configs = [
          { targets = [ "localhost:4000" ]; }
        ];
      }
    ];
  };
}
