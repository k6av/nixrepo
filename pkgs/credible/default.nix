{ pkgs, system, ... }: let rustPlatform = pkgs.makeRustPlatform {
  cargo = pkgs.rust-bin.nightly.latest.minimal;
  rustc = pkgs.rust-bin.nightly.latest.minimal;
}; in rustPlatform.buildRustPackage rec {
  inherit system;

  name = "credible";

  src = pkgs.fetchFromGitHub {
    owner = "k6av";
    repo = "credible";
    rev = "f5f174aacece4f3982a3d6672b1fd80c0dc8fcc9";
    sha256 = "sha256-BUdJ5Lv2pISUpqDtRsVmaDxaKbZpAiWIxNkZb/1nf1I==";
  };

  cargoHash = "sha256-IXiCtAsBMSQrt9tzUppCgYEO+s/F2wB5NabQlQYmoas=";

  meta = {
    description = "Fast and flexible credential generation";
    homepage = "https://github.com/k6av/credible";
    license = pkgs.lib.licenses.gpl3Plus;
  };
}
