extends Node2D

var agent : Agent = Agent.new()
var speed : float  = 200.0
var has_axe = false
var has_wood = false

func _ready() -> void:
	agent.object = self

func _process(delta: float) -> void:
	agent.exec_plan(delta)

func moveto(target: Vector2, delta: float):
	position += (target - position).normalized() * speed * delta
