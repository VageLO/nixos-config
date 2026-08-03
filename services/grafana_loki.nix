{ config, pkgs, ... }:

{
  services.loki = {
    enable = true;
    configFile = pkgs.writeText "loki-config.yaml" ''
      auth_enabled: false
      server:
        http_listen_port: 3100
      common:
        ring:
          instance_addr: 127.0.0.1
          kvstore:
            store: inmemory
        replication_factor: 1
        path_prefix: /var/lib/loki
        storage:
          filesystem:
            chunks_directory: /var/lib/loki/chunks
            rules_directory: /var/lib/loki/rules
      storage_config:
        filesystem: {}
      schema_config:
        configs:
          - from: 2020-10-24
            store: tsdb
            object_store: filesystem
            schema: v13
            index:
              prefix: index_
              period: 24h
    '';
  };

  services.alloy = {
    enable = true;
  };
  environment.etc."alloy/config.alloy".text = ''
    loki.relabel "journal" {
      forward_to = []

      rule {
        source_labels = ["__journal__systemd_unit"]
        regex = "(.*)\\.service"
        target_label = "service"
      }

    }

    loki.source.journal "read"  {
      forward_to    = [loki.write.endpoint.receiver]
      relabel_rules = loki.relabel.journal.rules
      labels        = {component = "loki.source.journal"}
    }

    loki.source.journal "nginx_logs" {
      forward_to = [loki.write.endpoint.receiver]
      matches    = "_SYSTEMD_UNIT=bsmmex.service"
      labels     = {service = "bsmmex"}
    }

    loki.write "endpoint" {
      endpoint {
        url = "http://localhost:3100/loki/api/v1/push"
      }
    }
  '';
}
