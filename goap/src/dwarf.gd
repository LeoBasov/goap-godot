extends Node2D

var agent : Agent = Agent.new()
var speed : float  = 1.0
var has_axe = false

func _ready() -> void:
	agent.object = self

func _process(delta: float) -> void:
	agent.exec_plan()

func moveto(target: Vector2):
	position += (target - position).normalized() * speed
