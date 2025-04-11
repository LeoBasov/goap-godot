extends Action

func _init() -> void:
	precondition["has_axe"] = true
	precondition["tree_exist"] = true
	precondition["has_wood"] = false
	
	result["has_wood"] = true

func execute(delta: float):
	print("cut tree")
