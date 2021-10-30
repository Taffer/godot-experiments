extends KinematicBody2D


# Player movement speed
export var speed = 100

var screen_rect: Rect2
var sara: AnimatedSprite
var sara_height: int
var sara_width: int


func _ready():
	screen_rect = get_node("..").get_viewport_rect()

	sara = get_node("Sara")
	sara_width = sara.frames.get_frame("idle", 0).get_width()
	sara_height = sara.frames.get_frame("idle", 0).get_height()


func _physics_process(delta):
	# Get player input
	var direction: Vector2
	direction.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	direction.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	
	# Clamp movement to the screen rectangle.
	if direction.x + position.x < sara_width / 2:
		direction.x = 0
	if direction.y + position.y < sara_height / 2:
		direction.y = 0
	if direction.x + position.x > screen_rect.end.x - sara_width / 2:
		direction.x = 0
	if direction.y + position.y > screen_rect.end.y - sara_width / 2:
		direction.y = 0

	var walking := false

	if Input.is_action_pressed("ui_left"):
		sara.animation = "walk_left"
		walking = true
	if Input.is_action_pressed("ui_right"):
		sara.animation = "walk_right"
		walking = true
	if Input.is_action_pressed("ui_up"):
		sara.animation = "walk_up"
		walking = true
	if Input.is_action_pressed("ui_down"):
		sara.animation = "walk_down"
		walking = true

	if not walking:
		sara.animation = "idle"
	
	# If input is digital, normalize it for diagonal movement
	if abs(direction.x) == 1 and abs(direction.y) == 1:
		direction = direction.normalized()
	
	# Apply movement
	var movement = speed * direction * delta
	move_and_collide(movement)
