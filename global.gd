extends CanvasLayer

var title_option = "play"

func format_time(time):
	return "%06.3f" % (time / 1000.0)

@onready var Fade = $Overlay/Fade

func _ready():
	Fade.play("fade-out")

func go_to_scene(path):
	Fade.play("fade-in")
	await Fade.animation_finished
	get_tree().change_scene_to_file(path)
	Fade.play("fade-out")
