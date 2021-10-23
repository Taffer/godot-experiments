extends Node2D

var offset: Vector2
var tile_layer: TileMap
var tile_layer2: TileMap
var viewport: Rect2
var viewport_map: Rect2
var map_rect: Rect2

var cell_width: float
var cell_height: float

func _ready():
	tile_layer = get_node("Tile Layer 1")
	tile_layer2 = get_node("Tile Layer 2")
	offset = tile_layer.position
	cell_width = tile_layer.cell_size.x
	cell_height = tile_layer.cell_size.y
	
	viewport = tile_layer.get_viewport().get_visible_rect()
	viewport_map.position = tile_layer.world_to_map(viewport.position)
	viewport_map.end = tile_layer.world_to_map(viewport.end)
	map_rect = tile_layer.get_used_rect()
	map_rect.position = tile_layer.map_to_world(map_rect.position)
	map_rect.end = tile_layer.map_to_world(map_rect.end)
	print(viewport_map)
	print(tile_layer.get_used_rect())
	print(viewport)
	print(map_rect)


func _process(_delta):
	if Input.is_action_pressed("ui_cancel"):
		get_tree().quit()

	var update := false
	if Input.is_action_just_released("ui_down"):
		offset.y -= cell_height
		update = true
	if Input.is_action_just_released("ui_up"):
		offset.y += cell_height
		update = true
	if Input.is_action_just_released("ui_left"):
		offset.x += cell_width
		update = true
	if Input.is_action_just_released("ui_right"):
		offset.x -= cell_width
		update = true

	if update:
		# Clamp to the size of the map.
		if viewport.end.x - offset.x > map_rect.end.x:
			offset.x += cell_width
		elif viewport.position.x - offset.x < 0:
			offset.x -= cell_width
		if viewport.end.y - offset.y > map_rect.end.y:
			offset.y += cell_height
		elif viewport.position.y - offset.y < 0:
			offset.y -= cell_height

		tile_layer.position = offset
		tile_layer2.position = offset
