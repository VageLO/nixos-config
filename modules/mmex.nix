{ pkgs, ... }:

let
  mmex = pkgs.stdenv.mkDerivation
    rec {
      name = "mmex";

      src = pkgs.fetchFromGitHub {
        owner = "moneymanagerex";
        repo = "moneymanagerex";
        rev = "d30879a42c471bd707611add65ab589a62e0a61d";
        sha256 = "sha256-TOT5dFDCF3F1L8P2u+9Ve3/N9mtBD2/KirzF0pyfdIA";
        fetchSubmodules = true;
      };

      buildInputs = with pkgs; [
        cmake
        git
        appstream
        lsb-release
        wxGTK32
        curl
        pkg-config
        gtk3
        lua
        wget
        help2man
      ];

      buildPhase = ''
        echo "Building mmex..."
        cmake .. 
      '';

      installPhase = ''
        echo "Installing mmex..."
        make VERBOSE=1
        make install
      '';
    };

in
{
  home.packages = [
    mmex
  ];
}
