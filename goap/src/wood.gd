extends Node2D

func snap(grid):
	var grid_pos : Vector2 = grid.local_to_map(0.5*position)
	
	position = grid.map_to_local(grid_pos)
	position.x *= $Sprite2D.scale.x
	position.y *= $Sprite2D.scale.y
