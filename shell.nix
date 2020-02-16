with import <nixpkgs> {};

let extdeps = [ zlib ];
in
mkShell {
  buildInputs = [
    (haskellPackages.ghcWithPackages (pkgs: [ 
      pkgs.brittany
      pkgs.cabal-install
      pkgs.hlint
      pkgs.hoogle
      pkgs.stylish-cabal
    ]))
    ghcid
  ] ++ extdeps;

  shellHook = ''
    export LD_LIBRARY_PATH=${pkgs.lib.makeLibraryPath extdeps }:$LD_LIBRARY_PATH
  '';
}
