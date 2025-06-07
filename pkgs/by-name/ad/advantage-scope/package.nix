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
        hash = "sha256-bpEa6yHIQjpKJ31iGzQnCXAQtL4wsg7rmBBGgnrDF4Q=";
    };

    npmDepsHash = "sha256-fGwO8tFTA7zulOrRL4x7XoJViL3nEZTnqdFlHTwPwbc=";
    makeCacheWritable = true;
    npmFlags = [ "--legacy-peer-deps" "--ignore-scripts" ];

    preBuild = ''
        cd $TMPDIR
        export EMSCRIPTENCACHE=$(mkdir emscriptencache)
        cd $./source
    '';
    buildPhase = ''
        npm run compile
        npm run wasm:compile
        # ls -a
        # cd
        cp -r ${electron.dist} electron-dist
        chmod -R u+w electron-dist
        npx electron-builder build -l -c.electronDist=electron-dist -c.electronVersion=${electron.version}
    '';
    postBuild = ''
    ls -a
    cd dist
    ls -a
    cd ..
    cp -r dist $out 
    '';

    meta = {
        description = "AdvantageScope is a robot diagnostics, log review/analysis, and data visualization application for FIRST teams developed by Team 6328";
        homepage = "https://docs.advantagescope.org/";
        license = lib.licenses.mit;
        maintainers = with lib.maintainers; [ ];
    };

    nativeBuildInputs = [ emscripten electron nodejs ];
    buildInputs = [ emscripten electron nodejs ];
})
