class_name Agent extends Node

var plan = null
var object = null
var actions = []
var action_do_nothing = ActionDoNoting.new()
var state = Dictionary()

func _init() -> void:
	actions.append(ActionGetAxe.new())
	
	state["axe_exists"] = false
	state["has_axe"] = false
	
func update_state():
	pass

func make_plan() -> void:
	plan = []
