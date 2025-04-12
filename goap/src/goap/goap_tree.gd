class_name GoapTree extends Node

var root : GoapTreeNode = null

func create_node(parent: GoapTreeNode, action: Action):
	var node = GoapTreeNode.new()
	
	node.parent = parent
	node.action = action
	
	return node

func build_tree(goal : Dictionary, state : Dictionary, actions : Array):
	root = null
	
	for action in actions:
		if action.check_goal(goal):
			root = create_node(null, action)
			
	add_children(root, state, actions)

func add_children(node: GoapTreeNode, state : Dictionary, actions : Array):
	if node.action.check_preconditions(state):
		return
		
	for action in actions:
		if node.action == action:
			continue
		elif check_child_conditions(action, state, node.action.precondition):
			node.children.append(create_node(node, action))
			
	for child in node.children:
		add_children(child, state, actions)
			
func check_child_conditions(action: Action, state: Dictionary, preconditions: Dictionary) -> bool:
	var post_state = action.get_post_state()
	
	for condition in preconditions:
		if state[condition] == preconditions[condition]:
			continue
		elif condition in post_state and (post_state[condition] == preconditions[condition]):
			continue
		else:
			return false 
			
	return true
