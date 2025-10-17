{ config, ... }:
{
  programs.ssh = {
    enable = true;

    matchBlocks = {
      "github.com" = {
        hostname = "github.com";
        user = "git";
        identityFile = "~/.ssh/id_ed25519_github";
        identitiesOnly = true;
      };

      "gitlab.com" = {
        hostname = "gitlab.com";
        user = "git";
        identityFile = "~/.ssh/id_ed25519_gitlab";
        identitiesOnly = true;
      };

      "gitlab.strath.ac.uk" = {
        hostname = "gitlab.strath.ac.uk";
        user = "git";
        identityFile = "~/.ssh/id_ed25519_strath";
        identitiesOnly = true;
      };
    };
  };
}
