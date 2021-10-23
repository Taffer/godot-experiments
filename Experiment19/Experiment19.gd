extends ColorRect

var grass: Texture
var grass_height: int
var grass_width: int

var sara: AnimatedSprite
var sara_height: int
var sara_width: int


func _ready():
	grass = preload("res://resources/grass.png")
	grass_height = grass.get_height()
	grass_width = grass.get_width()

	sara = get_node("Sara")
	sara_width = sara.frames.get_frame("idle", 0).get_width()
	sara_height = sara.frames.get_frame("idle", 0).get_height()


func _process(_delta):
	if Input.is_action_pressed("ui_cancel"):
		get_tree().quit()

	var walking := false

	if Input.is_action_pressed("ui_left"):
		sara.position.x -= 1
		sara.animation = "walk_left"
		walking = true
	if Input.is_action_pressed("ui_right"):
		sara.position.x += 1
		sara.animation = "walk_right"
		walking = true
	if Input.is_action_pressed("ui_up"):
		sara.position.y -= 1
		sara.animation = "walk_up"
		walking = true
	if Input.is_action_pressed("ui_down"):
		sara.position.y += 1
		sara.animation = "walk_down"
		walking = true

	# Clamp Sara's position
	if sara.position.x  < 0:
		sara.position.x = 0
	elif sara.position.x + sara_width > get_viewport_rect().end.x:
		sara.position.x = get_viewport_rect().end.x - sara_width
	if sara.position.y < 0:
		sara.position.y = 0
	elif sara.position.y + sara_height > get_viewport_rect().end.y:
		sara.position.y = get_viewport_rect().end.y - sara_height

	if not walking:
		sara.animation = "idle"


func _draw():
	var rect = get_rect()

	for y in range(0, rect.end.y, grass_height):
		for x in range(0, rect.end.x, grass_width):
			draw_texture(grass, Vector2(x, y))
