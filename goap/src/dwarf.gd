extends Node2D

var agent : GoapAgent = GoapAgent.new()
var speed : float  = 1.0

func _ready() -> void:
	agent.object = self

func _process(delta: float) -> void:
	if agent.plan != null:
		moveto(Vector2(0, 0))
	else:
		print("making plan")
		agent.make_plan()

func moveto(target: Vector2):
	position += (target - position).normalized() * speed
