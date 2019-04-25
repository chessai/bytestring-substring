{ pkgs }:

self: super:

with { inherit (pkgs.stdenv) lib; };

with pkgs.haskell.lib;

{
  bytestring-substring = (
    with rec {
      bytestring-substringSource = pkgs.lib.cleanSource ../.;
      bytestring-substringBasic  = self.callCabal2nix "bytestring-substring" bytestring-substringSource { };
    };
    overrideCabal bytestring-substringBasic (old: {
    })
  );
}
