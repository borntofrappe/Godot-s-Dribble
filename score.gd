extends Node

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
	var saved_data: SavedData = load(Global.save_path)
	var record = saved_data.record if saved_data else 0
	
	if record != 0 and record < 60*1000:
		var children = $Score.get_children()
		var chars = Global.format_time(record).replace(".","")
		for i in len(chars):
			children[i].texture = textures[int(chars[i])]
