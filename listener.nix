let
  nixpkgs = builtins.fetchGit {
    url = "https://github.com/NixOS/nixpkgs.git";
    ref = "nixos-19.09";
    rev = "27a5ddcf747fb2bb81ea9c63f63f2eb3eec7a2ec";
  };
  pkgs = import nixpkgs {};
  buildAgent = pkgs.writeScriptBin "builder.sh" ''
    ${pkgs.nix}/bin/nix-store --import
  '';
in  pkgs. "listener.sh" ''
  ${pkgs.socat}/bin/socat - TCP-LISTEN:alternativebit.fr:6666 EXEC:${buildAgent} 
 ''
