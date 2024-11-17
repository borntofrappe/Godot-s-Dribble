extends CanvasLayer

func format_time(time):
	return "%06.3f" % (time / 1000.0)

@onready var Fade = $Overlay/Fade

func _ready():
	$Overlay/Fade.play("fade-out")
