extends TextureRect

var black := Color(0, 0, 0, 255)
var colour_rect: ColorRect
var fade_out := false
var alpha = 255

func _ready():
	colour_rect = get_node("ColorRect")
	colour_rect.color = black


func _process(delta):
	if Input.is_action_pressed("ui_cancel"):
		get_tree().quit()

	if fade_out:
		alpha += delta * 120
		if alpha > 255:
			alpha = 255
			fade_out = false
	else:
		alpha -= delta * 120
		if alpha < 0:
			alpha = 0
			fade_out = true

	black.a = alpha / 255.0
	colour_rect.color = black
