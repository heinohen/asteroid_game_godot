extends Area2D

@export var LaserMoveSpeed := 500


func _process(delta):
	position.y -= LaserMoveSpeed * delta
