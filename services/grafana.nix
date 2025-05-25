{ pkgs, ... }:

{
  services.grafana = {
    enable = true;

    declarativePlugins = with pkgs.grafanaPlugins; [
      (grafana-piechart-panel.overrideAttrs (_: {
        version = "1.6.4";
        src = pkgs.fetchzip {
          url = "https://github.com/grafana/piechart-panel/releases/download/v1.6.4/grafana-piechart-panel-1.6.4.zip";
          hash = "sha256-umoQMcRe70GuPNHEg12Xwz7GxEjdNE5Qjii6jwQkqWw=";
        };
      }))
    ];

    provision = {
      datasources.settings.datasources = [
        {
          name = "Prometheus";
          type = "prometheus";
          url = "http://localhost:9090";
          isDefault = true;
        }
      ];
    };

  };

  systemd.services.grafana.environment = {
    GF_PANELS_DISABLE_SANITIZE_HTML = "true";
  };
}
