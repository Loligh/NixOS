hl.curve("main", {
  type = "spring",
  mass = 1,
  stiffness = 300,
  dampening = 22,
})

hl.animation({
  leaf = "global",
  enabled = true,
  speed = 1,
  spring = "main",
})
