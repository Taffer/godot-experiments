extends ColorRect


var ticks := 0.0


const ONE_SIXTY := 1.0/60.0

var fade_rect = null


func _ready():
	fade_rect = get_node("FadeRobot/FadeRect")


func _process(delta):
	ticks += delta
	
	if ticks > ONE_SIXTY:
		ticks -= ONE_SIXTY
		fade_rect.color.a -= (ONE_SIXTY / 2.0)
		if fade_rect.color.a < 0:
			fade_rect.color.a = 1.0

	if Input.is_action_pressed("ui_cancel"):
		get_tree().quit()
