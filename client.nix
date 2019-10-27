let
  nixpkgs = builtins.fetchGit {
    url = "https://github.com/NixOS/nixpkgs.git";
    ref = "nixos-19.09";
    rev = "27a5ddcf747fb2bb81ea9c63f63f2eb3eec7a2ec";
  };
  pkgs = import nixpkgs {};
in pkgs.writeScriptBin "client.sh" ''
    ${pkgs.socat}/bin/socat - TCP:alternativebit.fr:6666
  ''
