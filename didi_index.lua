-- Didi Index - Agulhada do Didi
-- Iq Option
-- Developer: Anderson de Assis, 09/05/2022

instrument { name = "Didi Index", short_name = "Didi Index", overlay = false }

input_group {
   "fast",
   fast = input (3, "Fast period", input.integer, 1, 250),
   color_fast = input { default = "green", type = input.color },
   width_fast = input { default = 1, type = input.line_width}
}

input_group {
   "medium",
   medium = input (8, "Medium period", input.integer, 1, 250),
   color_medium = input { default = "white", type = input.color },
   width_medium = input { default = 1, type = input.line_width }
}

input_group {
   "slow",
   slow = input (20, "Slow period", input.integer, 1, 250),
   color_slow = input { default = "tomato", type = input.color },
   width_slow = input { default = 1, type = input.line_width}
}

mediumma = sma (close, medium)
fastma = sma (close, fast) / mediumma
slowma = sma (close, slow) / mediumma
mediumma = 1 

plot (fastma, "FAST", color_fast, width_fast)
plot (mediumma, "MEDIUM", color_medium, width_medium)
plot (slowma, "SLOW", color_slow, width_slow)
