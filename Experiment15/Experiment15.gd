extends ColorRect


var grass: Texture
var grass_height: int
var grass_width: int

func _ready():
	grass = preload("res://resources/grass.png")
	grass_height = grass.get_height()
	grass_width = grass.get_width()


func _process(_delta):
	if Input.is_action_pressed("ui_cancel"):
		get_tree().quit()


func _draw():
	var rect = get_rect()

	for y in range(0, rect.end.y, grass_height):
		for x in range(0, rect.end.x, grass_width):
			draw_texture(grass, Vector2(x, y))
