{ pkgs, system }: pkgs.buildGoModule rec {
  inherit system;

  name = "wholeaked";

  src = pkgs.fetchFromGitHub {
    owner = "utkusen";
    repo = "wholeaked";
    rev = "ad23152aff873baf1f800a5ea48c208831649b03";
    sha256 = "sha256-PH6tCfzQvvGnRrIKbAcninICyrGvRdanoYS4TQ1K8PA=";
  };

  vendorHash = "sha256-owIkbJMap8mWRmhDmNKL4oWsVPI2Ed//Xodl7pUiYdg=";

  meta = {
    description = "Find the responsible person in case of a leakage";
    homepage = "https://github.com/utkusen/wholeaked";
    license = pkgs.lib.licenses.bsd3;
  };
}
