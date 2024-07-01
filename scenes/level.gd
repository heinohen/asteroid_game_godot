extends Node2D

# 1. Load a scene
var meteor_scene: PackedScene = load("res://scenes/meteor.tscn")
var laser_scene: PackedScene = load("res://scenes/laser.tscn")

var playerHealth: int = 3

func _ready():
	# Initial health ui for player
	get_tree().call_group('ui','set_health', playerHealth)
	# Stars
	var size := get_viewport().get_visible_rect().size
	var rng :=RandomNumberGenerator.new()
	
	for star in $Stars.get_children():
		
		# pos
		var random_x = rng.randi_range(0, int(size[0]))
		var random_y = rng.randi_range(0, int(size[1]))
		star.position = Vector2(random_x, random_y)
		
		# scale
		var random_scale = rng.randf_range(1,2)
		star.scale = Vector2(random_scale, random_scale)
		
		# anim speed
		star.speed_scale = rng.randf_range(0.1, 1.1)


func _on_meteor_timer_timeout():
	
	# 2. create an instance
	var meteor = meteor_scene.instantiate()
	# 3. attach node to scene tree
	$Meteors.add_child(meteor)
	
	# connect the signal
	
	meteor.connect('collision', on_meteor_collision)


func on_meteor_collision():
	print('meteor collision in levelfile')
	playerHealth -= 1
	get_tree().call_group('ui','set_health', playerHealth)
	if playerHealth <= 0:
		print('game over')
		

func _on_player_laser(pos):
	var laser = laser_scene.instantiate()
	$Lasers.add_child(laser)
	laser.position = pos
	print("shoot", position) 
