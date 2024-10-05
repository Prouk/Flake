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
            gtk = {
                enable = true;
			};
            x11 = {
                enable = true;
			};
			name = "graphite-dark-nord";
            package = pkgs.graphite-cursors;
			size = 24;
        };
    };

    gtk = {
		enable = true;
		cursorTheme = {
			name = "graphite-dark-nord";
			package = pkgs.graphite-cursors;
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

	home = {
	    packages = with pkgs; [
		    btop
		    eww
		    hyprpaper
		    hyprshot
			jetbrains-toolbox
			playerctl
			pwvucontrol
			rofi
			vesktop
			wev
			xfce.thunar
			fastfetch
		];
	};

    programs = {
        firefox = {
			enable = true;
        };
        kitty = {
            enable = true;
            shellIntegration = {
                enableFishIntegration = true;
			};
			settings = {
			    confirm_os_window_close = 0;
			};
            theme = "Gruvbox Dark";
		};
        man = {
            generateCaches = true;
		};
		mangohud = {
			enable = true;
		};
	};
}
