extends ColorRect

var grass: Texture
var grass_height: int
var grass_width: int

var sara: AnimatedSprite
var sara_height: int
var sara_width: int


func _ready():
	randomize()

	grass = preload("res://resources/grass.png")
	grass_height = grass.get_height()
	grass_width = grass.get_width()

	sara = get_node("Player/Sara")
	sara_width = sara.frames.get_frame("idle", 0).get_width()
	sara_height = sara.frames.get_frame("idle", 0).get_height()

	var column: StaticBody2D = get_node("Column")
	for _i in range(10):
		var dupe: StaticBody2D = column.duplicate(DUPLICATE_USE_INSTANCING)
		dupe.position.x = randi() % int(get_viewport_rect().size.x)
		dupe.position.y = randi() % int(get_viewport_rect().size.y)
		add_child(dupe)

	remove_child(column)  # This is just a template.


func _process(_delta):
	if Input.is_action_pressed("ui_cancel"):
		get_tree().quit()


func _draw():
	var rect = get_rect()

	for y in range(0, rect.end.y, grass_height):
		for x in range(0, rect.end.x, grass_width):
			draw_texture(grass, Vector2(x, y))
