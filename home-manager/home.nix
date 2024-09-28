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
        pointerCursor = {
            gtk.enable = true;
            package = pkgs.bibata-cursors-translucent;
			name = "Bibata Ghost";
			size = 24;
        };
    };

    wayland.windowManager.hyprland = {
		enable = true;
		settings = import ./hyprland.nix;
    };

	services.hyprpaper = {
	    enable = true;
	    settings = import ./hyprpaper.nix;
    };

	home.packages = with pkgs; [
	    btop
	    eww
	    firefox
	    hyprpaper
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
        man = {
            generateCaches = true;
		};
        kitty = {
            enable = true;
            shellIntegration.enableFishIntegration = true;
		};
	};
}