extends Node

func format_time(time):
	return "%06.3f" % (time / 1000.0)

var textures = [
	load("res://assets/art/score/number_0.png"),
	load("res://assets/art/score/number_1.png"),
	load("res://assets/art/score/number_2.png"),
	load("res://assets/art/score/number_3.png"),
	load("res://assets/art/score/number_4.png"),
	load("res://assets/art/score/number_5.png"),
	load("res://assets/art/score/number_6.png"),
	load("res://assets/art/score/number_7.png"),
	load("res://assets/art/score/number_8.png"),
	load("res://assets/art/score/number_9.png"),
]

func _ready():
	var children = $Score.get_children()
	var chars = format_time(123).replace(".","")
	for i in len(chars):
		children[i].texture = textures[int(chars[i])]
