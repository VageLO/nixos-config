{
  services.n8n = {
    enable = true;
    settings = {
      #NODE_FUNCTION_ALLOW_EXTERNAL = "sqlite, csv-parse, fs, cheerio && n8n start";
      #NODE_FUNCTION_ALLOW_BUILTIN = "fs,cheerio";
      #GENERIC_TIMEZONE = "Europe/Moscow";
    };
  };
}
