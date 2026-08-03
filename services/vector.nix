{
  services.vector = {
    enable = true;
    journaldAccess = true;
    settings = {
      sources.journald = {
        type = "journald";
      };

      sources.redis = {
        type = "redis";
        url = "redis://127.0.0.1:6379/0";
        data_type = "list";
        key = "vector";
      };

      #sources.docker_logs = {
      #  type = "docker_logs";
      #  docker_host = "/run/user/1000/docker.sock";
      #};

      sinks.victorialogs = {
        type = "http";
        inputs = [ "journald" "redis"];
        uri = "http://localhost:9428/insert/jsonline?_stream_fields=host,container_name,source_type&_msg_field=message&_time_field=timestamp";
        encoding.codec = "json";
        compression = "gzip";
        framing.method = "newline_delimited";
        healthcheck.enabled = false;
      };
    };
  };
}
