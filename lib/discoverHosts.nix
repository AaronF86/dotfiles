{ lib }:
{ path }:

let
  entries = builtins.attrNames (builtins.readDir path);

  validHosts = lib.filter
    (name:
      let
        entryPath = path + "/${name}";
        entryType = (builtins.readDir path).${name};
        defaultFile = entryPath + "/default.nix";
      in
      entryType == "directory" && builtins.pathExists defaultFile
    )
    entries;

  hosts = builtins.listToAttrs (map
    (name: {
      name = name;
      value = import (path + "/${name}/default.nix");
    })
    validHosts);
in
hosts
