class_name ActionGetAxe extends Action

var axe = null

func _init() -> void:
	precondition["axe_exists"] = true
	precondition["has_axe"] = false
	
	result["has_axe"] = true

func execute(delta: float):
	if axe == null:
		var dist_min = 1e6
		for space in object.get_tree().get_nodes_in_group("storage"):
			if space.get_current_object() == "axe":
				var dist = (space.position - object.position).length()
			
				if dist < dist_min:
					dist_min = dist
					axe = space
				
	if (axe.position - object.position).length() > 1:
		object.moveto(axe.position, delta)
		return false
	else:
		object.has_axe = true
		axe.empty()
		axe = null
		return true
