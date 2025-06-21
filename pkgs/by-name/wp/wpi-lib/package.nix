{
    lib,
    stdenv,
    gradle,
    makeWrapper,
    fetchFromGitHub,
}:
stdenv.mkDerivation (finalAttrs: {
    version = "2025.3.2";
    pname = "wpi-lib";

    src = fetchFromGitHub {
        owner = "wpilibsuite";
        repo = "allwpilib";
        tag = "v${finalAttrs.version}";
        hash = "sha256-x7yVWIS8c0cB5l4eHS+l3M77N0WKcJTiXBJgmmbjK4Y=";
    };

    nativeBuildInputs = [
        gradle
        makeWrapper
    ];

  mitmCache= gradle.fetchDeps {
    (finalAttrs) pname;
    data = ./deps.json;
  };
  
  __darwinAllowLocalNetworking = true;

  gradleBuildTask = "build";
})
