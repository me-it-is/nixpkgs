{
  fetchFromGitHub,
  flutterPackages-source,
  lib
}:
let
  v = "2025.2.2";
in 
flutterPackages-source.stable.buildFlutterApplication {
  pname = "elastic";
  version = v;

  src = fetchFromGitHub {
    owner = "Gold872";
    repo = "elastic-dashboard";
    rev = "v${v}";
    sha256 = "sha256-IwzOwMpcaTCyuQwKoYGj4n1Vsj7k4xyKLPpsgCaeaTc=";
  };

  meta = {
    description = "A simple and modern dashboard for FRC ";
    homepage = "https://frc-elastic.gitbook.io/docs";
  };
  gitHashes = {
    geekyants_flutter_gauges = "sha256-ZnZhsbxKIevv87v+6yUrwqVd/3XN/9mzvM9mNnFyuBQ=";
  };
  pubspecLock = lib.importJSON ./pubspec.lock.json;
}