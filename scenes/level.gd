extends Node2D

# 1. Load a scene
var meteor_scene: PackedScene = load("res://scenes/meteor.tscn")
var laser_scene: PackedScene = load("res://scenes/laser.tscn") 


func _on_meteor_timer_timeout():
	
	# 2. create an instance
	var meteor = meteor_scene.instantiate()
	# 3. attach node to scene tree
	$Meteors.add_child(meteor)


func _on_player_laser(pos):
	var laser = laser_scene.instantiate()
	$Lasers.add_child(laser)
	laser.position = pos
	print("shoot", position)
