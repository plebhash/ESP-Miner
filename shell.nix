{
  description = "A bitcoin ASIC miner for the ESP32";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    esp-dev.url = "github:mirrexagon/nixpkgs-esp-dev";
  };

  outputs = { self, nixpkgs, esp-dev }:
    let
      system = [ "x86_64-linux" "aarch64-linux" "aarch64-darwin" ];
      pkgs = import nixpkgs { inherit system; };
    in {
      devShells = {
        default = pkgs.mkShell {
          buildInputs = [
            esp-dev.packages.${system}.esp32-idf
          ];
          shellHook = ''
            echo "ESP-IDF environment is set up. Run 'idf.py' commands here."
            idf.py -h
          '';
        };
      };
    };
}