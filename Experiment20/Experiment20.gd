extends ColorRect


var grass: Texture
var grass_height: int
var grass_width: int

var sara: AnimatedSprite
var sara_height: int
var sara_width: int
var sara_animation: String
var sara_facing: String

var animation_idx := 0

# Animations and facings are presented in the order they appear on the LPC
# sprite sheets. The "idle" animation is one I've made up from the first frame
# of the "walk" animation.
const lpc_animations := [
	"cast",
	"thrust",
	"walk",
	"slash",
	"shoot",
	"hurt",
	"idle"
]

const lpc_facings := [
	"away",  # 0
	"left",  # 1
	"forward",  # 2
	"right"  # 3
]


func _ready():
	grass = preload("res://resources/grass.png")
	grass_height = grass.get_height()
	grass_width = grass.get_width()

	sara = get_node("Sara")
	sara_width = sara.frames.get_frame("idle_forward", 0).get_width()
	sara_height = sara.frames.get_frame("idle_forward", 0).get_height()
	sara_animation = lpc_animations[animation_idx]
	sara_facing = lpc_facings[0]

	set_animation(sara_animation, sara_facing)
	sara.playing = true


func _process(_delta):
	if Input.is_action_pressed("ui_cancel"):
		get_tree().quit()

	var changed := false

	if Input.is_action_just_released("ui_select"):
		animation_idx += 1
		if animation_idx >= len(lpc_animations):
			animation_idx = 0
		sara_animation = lpc_animations[animation_idx]
		changed = true

	if Input.is_action_pressed("ui_left"):
		sara.position.x -= 1
		sara_facing = lpc_facings[1]
		changed = true
	if Input.is_action_pressed("ui_right"):
		sara.position.x += 1
		sara_facing = lpc_facings[3]
		changed = true
	if Input.is_action_pressed("ui_up"):
		sara.position.y -= 1
		sara_facing = lpc_facings[0]
		changed = true
	if Input.is_action_pressed("ui_down"):
		sara.position.y += 1
		sara_facing = lpc_facings[2]
		changed = true

	if changed:
		set_animation(sara_animation, sara_facing)

	# Clamp Sara's position
	if sara.position.x  < 0:
		sara.position.x = 0
	elif sara.position.x + sara_width > get_viewport_rect().end.x:
		sara.position.x = get_viewport_rect().end.x - sara_width
	if sara.position.y < 0:
		sara.position.y = 0
	elif sara.position.y + sara_height > get_viewport_rect().end.y:
		sara.position.y = get_viewport_rect().end.y - sara_height


func _draw():
	var rect = get_rect()

	for y in range(0, rect.end.y, grass_height):
		for x in range(0, rect.end.x, grass_width):
			draw_texture(grass, Vector2(x, y))


func set_animation(animation, facing):
	if animation == "hurt":
		facing = "foward"
		
	sara.animation = animation + "_" + facing
