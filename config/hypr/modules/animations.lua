hl.curve("main", {
	type = "spring",
	mass = 1,
	stiffness = 70,
	dampening = 11,
})

hl.animation({
	leaf = "global",
	enabled = true,
	speed = 1,
	spring = "main",
})
