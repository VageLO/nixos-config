{ pkgs, ... }:
{
  home.packages = with pkgs;
    let
      libdjinterop = pkgs.libdjinterop.overrideAttrs {
        src = fetchFromGitHub {
          owner = "xsco";
          repo = "libdjinterop";
          rev = "0.24.3";
          hash = "sha256-Fp7AwEOq2JOpL60GDAXmA15ptFeLoG79nnnPXHl1Hjw=";
        };
      };
      mixxx = (pkgs.mixxx.override { inherit libdjinterop; }).overrideAttrs (prev: {
        cmakeFlags = prev.cmakeFlags ++ [ "-DBUILD_BENCH=OFF" ];
        src = fetchFromGitHub {
          owner = "mixxxdj";
          repo = "mixxx";
          rev = "9e3f9bfbac5c6fde7c4ee5fed2b550aa62060a95";
          hash = "sha256-9z4UqmXR/n1CCr1/YzTNl5SdRgbZgN/i1JNfA4TLaXU=";
        };
      });
    in [
      # ...
      mixxx
    ];
}
