{
	wayland.windowManager.hyprland.settings = {
		moinitor = [
			"HDMI-A-1,3840x2160@120,1920x-200,1"
			"DP-1,1920x1080@120,0x0,1"
		];
		workspace = [
			"workspace = 1,monitor:DP-1"
			"workspace = 2,monitor:HDMI-A-1"
			"workspace = 3,monitor:HDMI-A-1"
			"workspace = 4,monitor:HDMI-A-1"
			"workspace = 5,monitor:HDMI-A-1"
			"workspace = 6,monitor:HDMI-A-1"
			"workspace = 7,monitor:HDMI-A-1"
			"workspace = 8,monitor:HDMI-A-1"
			"workspace = 9,monitor:HDMI-A-1"
			"workspace = 10,monitor:HDMI-A-1"
		];
		border_size = 0;
		gaps_in = 10;
		gaps_out = 20;
		layout = "dwindle";
		allow_tearing = "true";
		decoration = {
			rounding = "20";
			active_opacity = 1;
			fullscreen_opacity = 1;
			inactive_opacity = 0.75;
			drop_shadow = true;
			shadow_range = 10;
			shadow_render_power = 3;
			shadow_ignore_window = false;
			col.shadow = "0xee1a1a1a";
			blur = {
				enabled = true;
				size = 8;
				passes = 1;
				xray = true;
				popups = true;
			};
		};
		input = {
			kb_layout = "fr";
			sensitivity = 0;
			accel_profile = "flat";
			focus_on_close = 1;
		};
		misc = {
			# Sadge
			disable_hyprland_logo = true;
			disable_splash_rendering = true;
		};
		cursor = {
			no_hardware_cursors = true;
		};
	};
	bind = [
		"SUPER, code:24, exec, kitty"
		"SUPER, code:9, exec, killactive, "
		"SUPER CTRL, , togglefloating, "
		"SUPER, code:49, exec, rofi -show drun"
		"SUPER, code:39, togglesplit, "
		"SUPER, code:95, fullscreen, "
		"SUPER, code:114, workspace, +1"
		"SUPER, code:113, workspace, -1"
		"SUPER_ALT, code:114, movetoworkspace, +1"
		"SUPER_ALT, code:113, movetoworkspace, -1"
	];
	bindm = [
		"SUPER, mouse:272, movewindow"
		"SUPER, mouse:273, resizewindow"
	];
	windowrulev2 = [
		"suppressevent maximize, class:.*"
		"float, class:^(Rofi)$"
	];
}