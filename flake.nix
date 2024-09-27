{
	description = "Prouk's daily Flake";

	inputs = {
		# Nixpkgs
		nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

		# Home manager
		home-manager.url = "github:nix-community/home-manager";
		home-manager.inputs.nixpkgs.follows = "nixpkgs";
	};

	outputs = {
		self,
		nixpkgs,
		home-manager,
		...
	}@inputs:
		let
			inherit (self) outputs;
		in {
			nixosConfiguration.prouk = nixpkgs.lib.nixosSystem {
				prouk = nixpkgs.lib.nixosSystem {
					specialArgs = {inherit inputs outputs;};
					modules = [./nixos/configuration.nix];
				};
			};
		};
}