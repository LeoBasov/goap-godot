class_name Action extends Node

var result: Dictionary
var precondition: Dictionary
var object = null

func check_preconditions(state : Dictionary) -> bool:
	var check = true
	
	for key in precondition:
		if key not in state:
			return false
		else:
			check = check and (precondition[key] == state[key])
		
	return check
	
func check_goal(state : Dictionary) -> bool:
	var check = true
	
	for key in state:
		if key not in result:
			return false
		else:
			check = check and (result[key] == state[key])
		
	return check

func execute(delta: float):
	pass
