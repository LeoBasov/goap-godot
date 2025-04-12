class_name Agent extends Node

var plan = []
var object: set = set_object
var actions = []
var action_do_nothing = ActionDoNoting.new()
var state = Dictionary()
var current_action = null

func _init() -> void:
	actions.append(ActionGetAxe.new())
	actions.append(ActionCutTree.new())
	actions.append(ActionStoreItem.new())
	
	state["axe_exists"] = false
	state["has_axe"] = false
	state["tree_exist"] = false
	state["has_wood"] = false
	state["free_storage"] = false
	
func set_object(obj):
	object = obj
	action_do_nothing.object = obj
	
	for action in actions:
		action.object = obj
	
func update_state():
	state["axe_exists"] = false
	state["free_storage"] = false
	state["tree_exist"] = object.get_tree().get_nodes_in_group("trees").size() > 0
	
	for space in object.get_tree().get_nodes_in_group("storage"):
		if space.get_current_object() == "axe":
			state["axe_exists"] = true
		elif space.get_current_object() == "empty":
			state["free_storage"] = true
		
	state["has_axe"] = object.has_axe
	state["has_wood"] = object.has_wood

func make_plan() -> void:
	plan = []
	var goal = {"store_item" : true}
	
	update_state()
	
	var dummy_state = state.duplicate(true)
	
	for action in actions:
		if action.check_preconditions(dummy_state):
			if action.check_goal(goal):
				plan.append(action)
				current_action = plan.pop_front()
				break
			else:
				for substate in action.result:
					dummy_state[substate] = action.result[substate]
				
				plan.append(action)

func exec_plan(delta: float):
	if current_action == null:
		make_plan()
	else:
		if current_action.execute(delta):
			current_action = plan.pop_front()
