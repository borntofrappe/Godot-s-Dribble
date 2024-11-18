extends Node

var textures_records = [
	load("res://assets/art/ranking/record_1.png"),
	load("res://assets/art/ranking/record_2.png"),
	load("res://assets/art/ranking/record_3.png"),
]

var textures_numbers = [
	load("res://assets/art/ranking/number_0.png"),
	load("res://assets/art/ranking/number_1.png"),
	load("res://assets/art/ranking/number_2.png"),
	load("res://assets/art/ranking/number_3.png"),
	load("res://assets/art/ranking/number_4.png"),
	load("res://assets/art/ranking/number_5.png"),
	load("res://assets/art/ranking/number_6.png"),
	load("res://assets/art/ranking/number_7.png"),
	load("res://assets/art/ranking/number_8.png"),
	load("res://assets/art/ranking/number_9.png"),
]

func _ready():
	var saved_data: SavedData = load(Global.save_path)
	var record = saved_data.record if saved_data else 0
	var ranking = saved_data.ranking if saved_data else []

	var index = null
	if record != 0 and record < 60*1000:
		index = ranking.bsearch(record)
		if index < 3:
			ranking.insert(index, record)
	
	var len_ranking = len(ranking)
	var records = [$First, $Second, $Third]
	var z = 0
	for i in range(3):
		var children = records[i].get_children()
		children[len(children)-2].texture = textures_records[z]
		if i < len_ranking:
			var chars = Global.format_time(ranking[i]).replace(".","")
			for j in len(chars):
				children[j].texture = textures_numbers[int(chars[j])]
			z += 1
	if index:
		var children = records[index].get_children()
		children[len(children)-1].play("slide-in")

	var new_saved_data:SavedData = SavedData.new()
	new_saved_data.record = 0
	new_saved_data.ranking = ranking.slice(0, 3)
	ResourceSaver.save(new_saved_data, Global.save_path)

func _process(delta):
	if Input.is_action_just_pressed("a") or Input.is_action_just_pressed("b"):
		Global.go_to_scene("res://title.tscn")
