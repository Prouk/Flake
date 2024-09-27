{
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
			experimental-features = "nix-command" "flake";
			flake-registry = "";
			nix-path = config.nix.nixPath;
		};
		channel.enable = false;
		registry = lib.mapAttrs (_: flake: {inherit flake;}) flakeInputs;
		nixPath = lib.mapAttrsToList (n: _: "${n}=flake:${n}") flakeInputs;
    };

	boot.loader.systemd-boot.enable = true;
	boot.loader.efi.canTouchEfiVariables = true;

	time.timeZone = "Europe/Paris";
	i18n.defaultLocale = "en_US.UTF-8";
	console = {
		font = "Lat2-Terminus16";
		keymap = "fr";
	};

    networking.hostName = "prouk";
    users.users = {
		prouk = {
			isNormalUser = true;
			extraGroups = ["wheel"];
		};
    };

	home-manager = {
		extraSpecialArgs = { inherit inputs outputs; };
			users = {
			prouk = import ../home-manager/home.nix;
		};
	};

	fileSystems."/home/prouk/2To" = {
		device = "/dev/disk/by-label/NVME2To";
		fsType = "ext4";
	};

    services.pipewire = {
    	enable = true;
    	pulse.enable = true;
    };

    environment.systemPackages = with pkgs; [
    	git
    	home-manager
    	hyprland
    	kitty
    	nano
    ];

    # Graphics settings
    hardware.graphics.enable = true;
    services.xserver.videoDrivers = ["nvidia"];
    services.displayManager.sddm.wayland.enable = true;
    services.displayManager.sddm.enable = true;
    xdg.portal.wlr.enable = true;

	# Enabling mandatory soft
	programs.steam.enable = true;
    programs.home-manager.enable = true;
    programs.git.enable = true;

    systemd.user.startServices = "sd-switch";

    system.stateVersion = "24.05";
}