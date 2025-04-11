class_name ActionGetAxe extends Action

var axe = null

func _init() -> void:
	precondition["axe_exists"] = true
	precondition["has_axe"] = false
	
	result["has_axe"] = true

func execute():
	pass
