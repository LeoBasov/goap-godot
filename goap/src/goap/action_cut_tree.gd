class_name ActionCutTree extends Action

var tree = null

func _init() -> void:
	precondition["has_axe"] = true
	precondition["tree_exist"] = true
	precondition["has_wood"] = false
	
	result["has_wood"] = true

func execute(delta: float):
	if tree == null:
		var dist_min = 1e6
		for tr in object.get_tree().get_nodes_in_group("trees"):
			var dist = (tr.position - object.position).length()
			
			if dist < dist_min:
				dist_min = dist
				tree = tr
				
	if (tree.position - object.position).length() > 1:
		object.moveto(tree.position, delta)
		return false
	else:
		object.has_wood = true
		tree = null
		return true
