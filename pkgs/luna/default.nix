{ pkgs, system, ... }: pkgs.stdenv.mkDerivation rec {
  inherit system;

  name = "luna";
  
  nativeBuildInputs = [
    pkgs.gnumake
    pkgs.zlib
  ];

  src = pkgs.fetchFromGitHub {
    owner = "ndless-nspire";
    repo = "Luna";
    rev = "167c73bf98dd13d3f27d9182178aa7d506c5eb9c";
    sha256 = "sha256-eOx507QleO6PirknG/n2oJo9bW/rqFnVEruV+NV6z6k=";
  };

  buildPhase = ''
    make dist;
  '';
  installPhase = ''
    mkdir -p $out/bin;
    cp -r ./luna $out/bin/${name};
  '';

  meta = {
    description = "Create TNS files from Lua and XML";
    homepage = "https://github.com/ndless-nspire/Luna";
    license = pkgs.lib.licenses.mpl11;
  };
}
