extends Sprite2D 

@onready var tile_map = $"../TileMap"
@onready var sprite2d = $Sprite2D
var is_moving = false 

func _process(delta):
	if is_moving:
		return
		
	if Input.is_action_pressed("Down"):
		move(Vector2.DOWN)
	elif Input.is_action_pressed("Up"):
		move(Vector2.UP)
	elif Input.is_action_pressed("Left"):
		move(Vector2.LEFT)
	elif Input.is_action_pressed("Right"):
		move(Vector2.RIGHT)


func move(direction: Vector2):
	# get current tile Vector2i
	var current_tile: Vector2i = tile_map.local_to_map(global_position)
	# get target tile Vector2i
	var target_tile: Vector2i = Vector2i(
		current_tile.x + direction.x,
		current_tile.y + direction.y,
	)
	# get custom data layer from target tile
	var tile_data: TileData = tile_map.get_cell_tile_data(0, target_tile)

	if tile_data.get_custom_data("walkable") == false:
		return

	# Move player
	is_moving = true

	global_position = tile_map.map_to_local(target_tile)

	sprite2d.global_position = tile_map.map_to_local(current_tile)
