{
    inputs,
    lib,
    config,
    ...
}: {
    imports = [

    ];

    nixpkgs = {
        config = {
            allowUnfree = true;
            allowUnfreePredicate = _: true;
        };
    };

    home = {
        username = "prouk";
        homeDirectory = "/home/prouk";
    };

    programs.home-manager.enable = true;
    programs.git.enable = true;
    programs.fish.enable = true;

    systemd.user.startServices = "sd-switch";

    system.stateVersion = "24.05";
}