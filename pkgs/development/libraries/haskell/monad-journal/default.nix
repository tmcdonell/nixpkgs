# This file was auto-generated by cabal2nix. Please do NOT edit manually!

{ cabal, either, monadControl, mtl, transformers, transformersBase
}:

cabal.mkDerivation (self: {
  pname = "monad-journal";
  version = "0.5.0.1";
  sha256 = "1rxmz6hx8kh8sw497h4kpxkvhgaa7jbzif7qssjqijyfmghsxh80";
  buildDepends = [
    either monadControl mtl transformers transformersBase
  ];
  meta = {
    homepage = "http://github.com/phaazon/monad-journal";
    description = "Pure logger typeclass and monad transformer";
    license = self.stdenv.lib.licenses.bsd3;
    platforms = self.ghc.meta.platforms;
    maintainers = with self.stdenv.lib.maintainers; [ fuuzetsu ];
  };
})
