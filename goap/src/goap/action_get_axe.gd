class_name ActionGetAxe extends Action

var axe = null

func _init() -> void:
	precondition["axe_exists"] = true
	precondition["has_axe"] = false
	
	result["has_axe"] = true

func execute(delta: float):
	if axe == null:
		var dist_min = 1e6
		for ax in object.get_tree().get_nodes_in_group("axes"):
			var dist = (ax.position - object.position).length()
			
			if dist < dist_min:
				print("got axe goal")
				dist_min = dist
				axe = ax
				
	if (axe.position - object.position).length() > 1:
		object.moveto(axe.position, delta)
		return false
	else:
		axe.queue_free()
		axe = null
		return true
