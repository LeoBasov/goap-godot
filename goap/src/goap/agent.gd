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
	if object.get_tree().get_nodes_in_group("axes").size() > 0:
		state["axe_exists"] = true
	else:
		state["axe_exists"] = false
		
	state["has_axe"] = object.has_axe

func make_plan() -> void:
	plan = []
	var goal = {"has_axe" : true}
	
	update_state()
	
	for action in actions:
		if action.check_goal(goal):
			print("goal met")
			if action.check_preconditions(state):
				print("preconditons met")
				plan.append(action)
				current_action = plan.pop_back()
				break
			else:
				print("preconditons not met")

func exec_plan():
	if current_action == null:
		make_plan()
	else:
		if current_action.execute():
			current_action = null
