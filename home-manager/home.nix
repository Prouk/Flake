{
    inputs,
    outputs,
    pkgs,
    lib,
    config,
    ...
}: {
	imports = [
	    ./hyprland.nix
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
        stateVersion = "24.05";
    };

    wayland.windowManager.hyprland = {
		enable = true;
		settings = import ./hyprland.nix;
    };

	home.packages = with pkgs; [
	    btop
	    eww
	    firefox
	    hyprpaper
	    hyprshot
		jetbrains-toolbox
		pwvucontrol
		rofi
		steam
		vesktop
		wev
	];

    programs = {
        fish = {
            enable = true;
		};
        man = {
            generateCaches = true;
		};
        kitty = {
            shellIntegration.enableFishIntegration = true;
		};
	};
}