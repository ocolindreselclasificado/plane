{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = [
    pkgs.nodejs
    pkgs.yarn
    pkgs.python311Full
    pkgs.python311Packages.pip  # explicitly add pip
    pkgs.postgresql
  ];
}
