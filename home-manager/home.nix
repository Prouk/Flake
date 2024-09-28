{
    inputs,
    outputs,
    pkgs,
    lib,
    config,
    ...
}: {
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

	# services.hyprpaper = {
	#     enable = true;
	#     settings = ./hyprpaper.nix;
    # };

	home.packages = with pkgs; [
	    btop
	    eww
	    firefox
	    hyprshot
		jetbrains-toolbox
		playerctl
		pwvucontrol
		rofi
		steam
		vesktop
		wev
		xfce.thunar
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