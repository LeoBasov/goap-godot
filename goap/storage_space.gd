extends Node2D

enum Options {EMPTY, AXE, STONE, WOOD}
@export var current_object: Options

var options_map : Dictionary
var reverse_options_map : Dictionary
var sprite_map : Dictionary
var w : int = 16
var h : int = 16
var sprite : Sprite2D

func _ready() -> void:
	sprite = $Sprite2D
	
	check_state()

func _init() -> void:
	options_map["empty"] = Options.EMPTY
	options_map["axe"] = Options.AXE
	options_map["stone"] = Options.STONE
	options_map["wood"] = Options.WOOD
	
	reverse_options_map[Options.EMPTY] = "empty"
	reverse_options_map[Options.AXE] = "axe"
	reverse_options_map[Options.STONE] = "stone"
	reverse_options_map[Options.WOOD] = "wood"
	
	sprite_map[Options.EMPTY] = Rect2(368.0, 64.0, w, h)
	sprite_map[Options.AXE] = Rect2(672.0, 112.0, w, h)
	sprite_map[Options.STONE] = Rect2(0, 0, w, h)
	sprite_map[Options.WOOD] = Rect2(0, 0, w, h)
	
func check_state():
	if current_object == Options.EMPTY:
		$Sprite2D.region_rect = sprite_map[current_object]
		$Sprite2D.hide()
	else:
		$Sprite2D.region_rect = sprite_map[current_object]
		$Sprite2D.show()

func add(object_name):
	current_object = options_map[object_name]
	check_state()

func empty():
	current_object = Options.EMPTY
	check_state()
	
func get_current_object():
	return reverse_options_map[current_object]


func _on_area_2d_mouse_entered() -> void:
	$Sprite2D.show()

func _on_area_2d_mouse_exited() -> void:
	if current_object == Options.EMPTY:
		$Sprite2D.hide()
