extends Node2D

func snap(grid):
	var grid_pos : Vector2 = grid.local_to_map(Vector2(position.x / $Sprite2D.scale.x, position.y / $Sprite2D.scale.y))
	
	position = grid.map_to_local(grid_pos)
	position.x *= $Sprite2D.scale.x
	position.y *= $Sprite2D.scale.y
