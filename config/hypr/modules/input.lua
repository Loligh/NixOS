hl.config({
	input = {
		repeat_rate = 25,
		repeat_delay = 600,
		sensitivity = 0.0,
		accel_profile = "flat",
		touchpad = {
			disable_while_typing = true,
			natural_scroll = true,
			scroll_factor = 0.2,
			middle_button_emulation = false,
		},
	},
})

hl.device({
	name = "chicony-acer-tablet-keyboard",
	kb_layout = "de",
})
hl.device({
	name = "chicony-acer-tablet-keyboard-2",
	kb_layout = "de",
})
