extends TextureRect

var map_rect: Rect2
var map_scale := 1.0


func _ready():
	map_rect = get_rect()
	map_rect.position.x = 0
	map_rect.position.y = 0


func _draw():
	draw_rect(map_rect, Color(1.0, 0.0, 1.0), false)


func set_map_scale(scale: float):
	map_scale = scale


func set_map_view(location: Rect2):
	var size = location.size

	map_rect.position.x = location.position.x * map_scale
	map_rect.position.y = location.position.y * map_scale
	map_rect.size.x = size.x * map_scale
	map_rect.size.y = size.y * map_scale

	update()
