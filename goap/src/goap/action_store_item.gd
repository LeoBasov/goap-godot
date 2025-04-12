class_name ActionStoreItem extends Action

var storage = null

func _init() -> void:
	precondition["has_wood"] = true
	
	result["store_item"] = true
	result["has_wood"] = false

func execute(delta: float):
	if storage == null:
		var dist_min = 1e6
		for str in object.get_tree().get_nodes_in_group("storage"):
			var dist = (str.position - object.position).length()
			
			if str.get_current_object() == "empty" and dist < dist_min:
				dist_min = dist
				storage = str
				
	if (storage.position - object.position).length() > 1:
		object.moveto(storage.position, delta)
		return false
	else:
		object.has_wood = false
		storage.add("wood")
		storage = null
		return true
