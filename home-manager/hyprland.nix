{
	env = [
		"HYPRCURSOR_THEME,graphite-dark-nord"
		"HYPRCURSOR_SIZE,24"
	];
	monitor = [
		"HDMI-A-1,3840x2160@120,1080x-100,1"
		"DP-1,1920x1080@120,0x0,1,transform,1"
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
	general = {
		border_size = 0;
		gaps_in = 20;
		gaps_out = 40;
		layout = "dwindle";
		allow_tearing = "true";
	};
	decoration = {
		rounding = "20";
		active_opacity = 1;
		fullscreen_opacity = 1;
		inactive_opacity = 0.75;
		drop_shadow = true;
		shadow_range = 20;
		shadow_render_power = 3;
		shadow_ignore_window = false;
		"col.shadow" = "0xee1a1a1a";
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
	bind = [
		"SUPER, code:24, exec, kitty"
		"SUPER, code:9, killactive, "
		"SUPER, code:37, togglefloating, "
		"SUPER, code:49, exec, rofi -show drun"
		"SUPER SHIFT, code:39, exec, hyprshot -m region --clipboard-only"
		"SUPER, code:39, togglesplit, "
		", code:95, fullscreen, 0"
		"SUPER, code:114, workspace, +1"
		"SUPER, code:113, workspace, -1"
		"SUPER_ALT, code:114, movetoworkspace, +1"
		"SUPER_ALT, code:113, movetoworkspace, -1"
		", code:172, exec, playerctl play-pause"
		", code:171, exec, playerctl next"
		", code:173, exec, playerctl previous"
		", code:121, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
		"SUPER, code:67, exec, ${./sh/gamemode.sh}"
	];
	bindm = [
		"SUPER, mouse:272, movewindow"
		"SUPER, mouse:273, resizewindow"
	];
	windowrulev2 = [
		"float, class:^(Rofi)$"
	];
	bezier = [
		"main, 0.65, 0, 0.35, 1"
		"wow, 0.45, -0.3, 0.66, 1"
	];
	animation = [
		"workspaces, 1, 5, main, slidefadevert"
		"windows, 1, 3, main, slide"
	];
	"exec-once" = [
		"hyprpaper"
		"hyprctl setcursor graphite-dark-nord 24"
	];
}
