{
    imports = [
        ./hardware-configuration.nix
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

    networking.hostName = "prouk";
    users.users = {
		prouk = {
			isNormalUser = true;
			extraGroups = ["wheel"];
		};
    };

    system.stateVersion = "24.05";
}