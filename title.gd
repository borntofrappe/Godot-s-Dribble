extends Node

@onready var Pointer = $Pointer
const POINTER_Y = {
	"play" = 0,
	"ranking" = 9
}

func _ready():
	$Pointer.position.y = POINTER_Y["play"]
	$Pointer/PointerStart.play("default")
	$Pointer/PointerEnd.play("default")

func _process(delta):
	if Input.is_action_just_pressed("up"):
		Pointer.position.y = POINTER_Y["play"]
	elif Input.is_action_just_pressed("down"):
		Pointer.position.y = POINTER_Y["ranking"]
	
	if Input.is_action_just_pressed("a"):
		if Pointer.position.y == POINTER_Y["play"]:
			pass # play
		else:
			Global.go_to_scene("res://ranking.tscn")
