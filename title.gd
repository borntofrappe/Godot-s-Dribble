extends Node

@onready var Pointer = $Pointer
const POINTER_Y = {
	"play" = 0,
	"ranking" = 9
}

func _ready():
	$Pointer.position.y = POINTER_Y[Global.title_option]
	$Pointer/PointerStart.play("default")
	$Pointer/PointerEnd.play("default")

func _process(delta):
	if Input.is_action_just_pressed("up"):
		Global.title_option = "play"
		$Pointer.position.y = POINTER_Y[Global.title_option]
	elif Input.is_action_just_pressed("down"):
		Global.title_option = "ranking"
		$Pointer.position.y = POINTER_Y[Global.title_option]
	
	if Input.is_action_just_pressed("a"):
		if Global.title_option == "play":
			pass # play
		else:
			Global.go_to_scene("res://ranking.tscn")
