hl.bind("SUPER + RETURN", hl.dsp.exec_cmd("ghostty"))
hl.bind("SUPER + E", hl.dsp.exec_cmd("ghostty -e yazi"))
hl.bind("SUPER + B", hl.dsp.exec_cmd("zen"))
hl.bind("SUPER + SPACE", hl.dsp.exec_cmd("rofi -show run"))

hl.bind("SUPER + ESCAPE", hl.dsp.window.close(activewindow))
hl.bind("SUPER + ALT + 4", hl.dsp.window.kill(activewindow))
hl.bind("SUPER + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = toggle }))
hl.bind("SUPER + D", hl.dsp.window.float({ mode = "fullscreen", action = toggle }))
hl.bind("SUPER + BACKSLASH", hl.dsp.layout("togglesplit"))

hl.bind("ALT + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("ALT + mouse:273", hl.dsp.window.resize(), { mouse = true })

hl.bind("SUPER + H", hl.dsp.focus({ direction = "l" }))
hl.bind("SUPER + J", hl.dsp.focus({ direction = "d" }))
hl.bind("SUPER + K", hl.dsp.focus({ direction = "u" }))
hl.bind("SUPER + L", hl.dsp.focus({ direction = "r" }))

hl.bind("SUPER + SHIFT + H", hl.dsp.window.swap({ direction = "l" }))
hl.bind("SUPER + SHIFT + J", hl.dsp.window.swap({ direction = "d" }))
hl.bind("SUPER + SHIFT + K", hl.dsp.window.swap({ direction = "u" }))
hl.bind("SUPER + SHIFT + L", hl.dsp.window.swap({ direction = "r" }))

hl.bind("SUPER + ALT + H", hl.dsp.window.resize({ x = -10, y = 0 }))
hl.bind("SUPER + ALT + J", hl.dsp.window.resize({ x = 0, y = -10 }))
hl.bind("SUPER + ALT + K", hl.dsp.window.resize({ x = 0, y = 10 }))
hl.bind("SUPER + ALT + L", hl.dsp.window.resize({ x = 10, y = 0 }))

hl.bind("SUPER + I", hl.dsp.focus({ workspace = 1 }))
hl.bind("SUPER + O", hl.dsp.focus({ workspace = 2 }))
hl.bind("SUPER + P", hl.dsp.focus({ workspace = 3 }))

hl.bind("SUPER + SHIFT + I", hl.dsp.window.move({ workspace = "1", follow = true }))
hl.bind("SUPER + SHIFT + O", hl.dsp.window.move({ workspace = "2", follow = true }))
hl.bind("SUPER + SHIFT + P", hl.dsp.window.move({ workspace = "3", follow = true }))

hl.bind("SUPER + SHIFT + I", hl.dsp.window.move({ workspace = "1", follow = false }))
hl.bind("SUPER + SHIFT + O", hl.dsp.window.move({ workspace = "2", follow = false }))
hl.bind("SUPER + SHIFT + P", hl.dsp.window.move({ workspace = "3", follow = false }))
