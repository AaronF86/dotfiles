{ lib, home-manager, userPath, homePath }:

{ userMap }:

let
  userNames = lib.attrNames userMap;

  systemUsers = builtins.listToAttrs (map
    (userName: {
      name = userName;
      value = import (userPath + "/${userName}.nix");
    })
    userNames);

  homeManagerUsers = builtins.listToAttrs (map
    (userName: {
      name = userName;
      value = import (homePath + "/${userName}/default.nix");
    })
    (lib.attrNames (lib.filterAttrs (_: useHM: useHM) userMap)));
in
assert lib.isAttrs userMap || throw "mkUsers: userMap must be an attribute set";
{
  systemUsers = systemUsers;
  homeManagerUsers = homeManagerUsers;
}
