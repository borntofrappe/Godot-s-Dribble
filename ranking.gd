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
	var score = 0
	var scores = []
	var index = null
	if score != 0 and score < 60*1000:
		index = scores.bsearch(score)
		if index < 3:
			scores.insert(index, score)
	
	var len_scores = len(scores)
	var records = [$First, $Second, $Third]
	var z = 0
	for i in range(3):
		var children = records[i].get_children()
		children[len(children)-2].texture = textures_records[z]
		if i < len_scores:
			var chars = Global.format_time(scores[i]).replace(".","")
			for j in len(chars):
				children[j].texture = textures_numbers[int(chars[j])]
			z += 1
	if index:
		var children = records[index].get_children()
		children[len(children)-1].play("slide-in")

func _process(delta):
	if Input.is_action_just_pressed("a") or Input.is_action_just_pressed("b"):
		Global.go_to_scene("res://title.tscn")
