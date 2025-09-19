{ nixpkgs }:

machine:
nixpkgs.lib.nixosSystem {
  system = machine.arch;
  modules = [
    {
    }
  ];
}
