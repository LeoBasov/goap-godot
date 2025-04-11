extends Node2D

func _ready() -> void:
	get_tree().call_group("objects", "snap", $TileMapLayer)
