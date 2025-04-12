extends Node2D

func _ready() -> void:
	for object in get_tree().get_nodes_in_group("objects"):
		snap(object)

func snap(object):	
	var grid_pos : Vector2 = $TileMapLayer.local_to_map(Vector2(object.position.x / object.sprite.scale.x, object.position.y / object.sprite.scale.y))
	
	object.position = $TileMapLayer.map_to_local(grid_pos)
	object.position.x *= object.sprite.scale.x
	object.position.y *= object.sprite.scale.y
