extends Area2D

@export var LaserMoveSpeed := 50

func _process(delta):
	position.y -= LaserMoveSpeed * delta
