# This file was auto-generated by cabal2nix. Please do NOT edit manually!

{ cabal, mtl, QuickCheck, STMonadTrans, testFramework
, testFrameworkQuickcheck2
}:

cabal.mkDerivation (self: {
  pname = "equivalence";
  version = "0.2.5";
  sha256 = "014r9v81r7nj5pynfk3wa4lm4hk04123fgxkhb9a945wi6d9m5h3";
  buildDepends = [ mtl STMonadTrans ];
  testDepends = [
    mtl QuickCheck STMonadTrans testFramework testFrameworkQuickcheck2
  ];
  doCheck = false;
  meta = {
    homepage = "https://bitbucket.org/paba/equivalence/";
    description = "Maintaining an equivalence relation implemented as union-find using STT";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
  };
})
