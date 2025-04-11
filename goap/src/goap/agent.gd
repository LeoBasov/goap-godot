class_name Agent extends Node

var plan = []
var object: set = set_object
var actions = []
var action_do_nothing = ActionDoNoting.new()
var state = Dictionary()
var current_action = null

func _init() -> void:
	actions.append(ActionGetAxe.new())
	
	state["axe_exists"] = false
	state["has_axe"] = false
	
func set_object(obj):
	object = obj
	action_do_nothing.object = obj
	
	for action in actions:
		action.object = obj
	
func update_state():
	state["axe_exists"] = false
	
	for space in object.get_tree().get_nodes_in_group("storage"):
		if space.get_current_object() == "axe":
			state["axe_exists"] = true
		
	state["has_axe"] = object.has_axe

func make_plan() -> void:
	plan = []
	var goal = {"has_axe" : true}
	
	update_state()
	
	for action in actions:
		if action.check_goal(goal):
			if action.check_preconditions(state):
				plan.append(action)
				current_action = plan.pop_back()
				break
			else:
				pass

func exec_plan(delta: float):
	if current_action == null:
		make_plan()
	else:
		if current_action.execute(delta):
			current_action = null
