class_name Action extends Node

var result: Dictionary
var precondition: Dictionary

func check_preconditions(state : Dictionary) -> bool:
	var check = true
	
	for key in precondition:
		if key not in state:
			return false
		else:
			check = check and (precondition[key] == state[key])
		
	return check

func execute():
	pass
