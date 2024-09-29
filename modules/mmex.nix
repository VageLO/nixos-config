{ pkgs, ... }:

let
  mmex = pkgs.stdenv.mkDerivation
    rec {
      name = "mmex";

      src = pkgs.fetchFromGitHub {
        owner = "moneymanagerex";
        repo = "moneymanagerex";
        rev = "bb98eab92d95b7315d27f4e59ae59b50587106d8";
        sha256 = "sha256-hu5TGT3Xd2aY8UEqdCbS2PrCcCOB2YB2I7Kn1se8WIU=";
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
