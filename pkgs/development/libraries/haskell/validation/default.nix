# This file was auto-generated by cabal2nix. Please do NOT edit manually!

{ cabal, bifunctors, doctest, filepath, lens, QuickCheck
, semigroupoids, semigroups, transformers
}:

cabal.mkDerivation (self: {
  pname = "validation";
  version = "0.4.1";
  sha256 = "05mws9gqlqjmzcw6d3kclrh9dybchhp61qsfwg77h31n44j7w0mh";
  buildDepends = [
    bifunctors lens semigroupoids semigroups transformers
  ];
  testDepends = [ doctest filepath QuickCheck ];
  meta = {
    homepage = "https://github.com/tonymorris/validation";
    description = "A data-type like Either but with an accumulating Applicative";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})
