{ inputs, outputs, pkgs, lib, config, ... }: {
    imports = [
        ./hardware-configuration.nix
        inputs.home-manager.nixosModules.home-manager
    ];
    nixpkgs = {
		config = {
		    allowUnfree = true;
		};
    };
	nix = let
		flakeInputs = lib.filterAttrs (_: lib.isType "flake") inputs;
	in {
		settings = {
			experimental-features = ["nix-command" "flakes"];
			flake-registry = "";
			nix-path = config.nix.nixPath;
		};
		channel.enable = false;
		registry = lib.mapAttrs (_: flake: {inherit flake;}) flakeInputs;
		nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
    };

	boot = {
		loader = {
			systemd-boot.enable = true;
			efi = {
				canTouchEfiVariables = true;
			};
		};
		kernelPackages = pkgs.linuxPackages_xanmod_stable;
	};

	time = {
		timeZone = "Europe/Paris";
	};

	i18n = {
		defaultLocale = "en_US.UTF-8";
	};

	console = {
		font = "Lat2-Terminus16";
		keyMap = "fr";
	};

    networking = {
		hostName = "prouk";
	    enableIPv6 = false;
	    firewall.enable = false;
    };

    users = {
    	defaultUserShell = pkgs.fish;
	    users = {
			prouk = {
				isNormalUser = true;
				extraGroups = ["wheel" "gamemode"];
				useDefaultShell = true;
			};
	    };
    };

	home-manager = {
		extraSpecialArgs = { inherit inputs outputs; };
		users = {
			prouk = import ../home-manager/home.nix;
		};
		backupFileExtension = "backup";
	};

	fileSystems."/home/prouk/2To" = {
		device = "/dev/disk/by-label/NVME2To";
		fsType = "ext4";
	};

    services = {
    	pipewire = {
	    	enable = true;
	    	alsa = {
	    		enable = true;
	    	};
	    	pulse = {
	    		enable = true;
			};
	    	extraConfig = {
				pipewire = {
					"10-clock-rate" = {
						"context.properties" = {
							"default.clock.rate" = 44100;
				    	};
					};
					"11-clock-quantum" = {
						"context.properties" = {
							"default.clock.quantum-floor" = 128;
							"default.clock.quantum-limit" = 1024;
							"default.clock.min-quantum" = 128;
							"default.clock.max-quantum" = 1024;
							"default.clock.quantum" = 256;
				    	};
					};
				};
	    	};
	    };
    };

    environment = {
    	systemPackages = with pkgs; [
	    	git
	    	nano
	    ];
    };

    hardware = {
    	graphics = {
    		enable = true;
		};
    	nvidia = {
    		open = true;
		};
    };

    services = {
	    displayManager = {
		    sddm = {
		    	enable = true;
		    	wayland = {
		    		enable = true;
	    		};
		    };
	    };
		input-remapper = {
    		enable = true;
    	};
    	xserver = {
    		videoDrivers = ["nvidia"];
    	};
    };

    xdg = {
    	portal = {
    		wlr = {
    			enable = true;
			};
		};
	};

	programs = {
		fish = {
			enable = true;
		};
		gamemode = {
			enable = true;
			enableRenice = true;
		};
	    git = {
	    	enable = true;
    	};
	    hyprland = {
	    	enable = true;
	    	xwayland = {
	    		enable = true;
    		};
    	};
    	steam = {
			enable = true;
			extraPackages = with pkgs; [
				gamescope
			];
			gamescopeSession = {
				enable = true;
    		};
		};
	};

    system = {
    	stateVersion = "24.05";
	};
}