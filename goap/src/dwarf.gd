extends Node2D

var agent : Agent = Agent.new()
var speed : float  = 200.0
var has_axe: bool : set = set_axe
var has_wood: bool : set = set_wood

func _ready() -> void:
	has_axe = false
	agent.object = self

func _process(delta: float) -> void:
	agent.exec_plan(delta)

func moveto(target: Vector2, delta: float):
	position += (target - position).normalized() * speed * delta

func set_axe(state: bool):
	if state:
		$CarrySprite.set_object("axe")
	else:
		$CarrySprite.empty()
		
func set_wood(state: bool):
	if state:
		$CarrySprite.set_object("wood")
	else:
		$CarrySprite.empty()
