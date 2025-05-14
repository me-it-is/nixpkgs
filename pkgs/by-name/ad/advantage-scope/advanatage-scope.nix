{
    lib,
    buildNpmPackage,
    fetchFromGithub,
}:

buildNpmPackage (finalAttrs: {
    pname = "AdvantageScope";
    version = "4.1.6";

    src = fetchFromGithub {
        owner = "Mechanical-Advantage";
        repo = "AdvantageScope";
        tag = "v${finalAttrs.version}";
        hash = "sha256-fc37c9df006cdcb4f8329deb61e6669ba5d0755a";

    };


    npmDepsHash = "sha256-jrmgQr82XNY4NdUazwG7Sc4ctvgjFEUQ78MaRODyFOA=";

    meta = {
        description = "AdvantageScope is a robot diagnostics, log review/analysis, and data visualization application for FIRST teams developed by Team 6328";
        homepage = "https://docs.advantagescope.org/";
        license = lib.licenses.bsd3Clause;
        maintainers = with lib.maintainers; [ ];
    };
})
