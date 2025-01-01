#hosts/framework/user.nix

{ config, lib, inputs, ...}:

{
    imports = [ ../../modules/default.nix ];
    config.modules = {
        ghostty.enable = true;
    };
}