{
    lib,
    buildNpmPackage,
    fetchFromGitHub,
    fetchgit,
    emscripten,
    electron,
    nodejs
}:

buildNpmPackage (finalAttrs: {
    pname = "AdvantageScope";
    version = "4.1.7";

    src = fetchFromGitHub {
        owner = "me-it-is";
        repo = "AdvantageScope";
        #tag = "v${finalAttrs.version}";
        rev = "main";
        hash = "sha256-xJw+PKgu0ovS5WUzw6M5VOkAhEhlwEBBv3MKdlIxcjg=";
    };

    npmDepsHash = "sha256-fGwO8tFTA7zulOrRL4x7XoJViL3nEZTnqdFlHTwPwbc=";
    makeCacheWritable = true;
    npmFlags = [ "--legacy-peer-deps" "--ignore-scripts" ];
    installPhase = ''
    '';

    preBuild = ''
        cd $TMPDIR
        export EMSCRIPTENCACHE=$(mkdir emscriptencache)
        cd $TMPDIR/source
    '';
    buildPhase = ''
        cd docs/
        ls -a
        cd ..
        npm run build 
    '';

    meta = {
        description = "AdvantageScope is a robot diagnostics, log review/analysis, and data visualization application for FIRST teams developed by Team 6328";
        homepage = "https://docs.advantagescope.org/";
        license = lib.licenses.mit;
        maintainers = with lib.maintainers; [ ];
    };

    nativeBuildInputs = [ emscripten electron nodejs ];
})
