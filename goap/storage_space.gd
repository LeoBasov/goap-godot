extends Node2D

var sprite_map : Dictionary
var w : int = 16
var h : int = 16
var current_object = null

func _init() -> void:
	sprite_map["axe"] = Rect2(0, 0, w, h)
	sprite_map["stone"] = Rect2(0, 0, w, h)
	sprite_map["wood"] = Rect2(0, 0, w, h)

func add(object_name):
	current_object = object_name
	$Sprite2D.region_rect = sprite_map[current_object]
	$Sprite2D.show()

func empty():
	current_object = null
	$Sprite2D.hide()
