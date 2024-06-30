extends Node2D

# 1. Load a scene
var meteor_scene: PackedScene = load("res://scenes/meteor.tscn")  


func _on_meteor_timer_timeout():
	
	# 2. create an instance
	var meteor = meteor_scene.instantiate()
	# 3. attach node to scene tree
	$Meteors.add_child(meteor)
