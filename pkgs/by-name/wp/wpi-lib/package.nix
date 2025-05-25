{
    lib,
    stdenv,
    gradle,
    fetchFromGitHub,
}:
stdenv.mkDerivation (finalAttrs: {
    version = "2025.3.2";
    pname = "WPILib";

    src = fetchFromGitHub {
        owner = "wpilibsuite";
        repo = "allwpilib";
        tag = "v${finalAttrs.version}";
        rev = "main";
        hash = "sha256-OE4fFT9dnJn1G+0nKDjk5lAYCiiSkfazFYz7fSsK83E=";
    };

    nativeBuildInputs = [
        gradle
    ];

    mitmCache = gradle.fetchDeps {
    inherit (finalAttrs) pname;
    data = ./deps.json;
  };

  __darwinAllowLocalNetworking = true;

  gradleBuildTask = "build";
})
