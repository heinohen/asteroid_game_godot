extends Node2D

# 1. Load a scene
var meteor_scene: PackedScene = load("res://scenes/meteor.tscn")
var laser_scene: PackedScene = load("res://scenes/laser.tscn")
var game_over_scene: PackedScene = load("res://scenes/game_over.tscn")
var health_scene: PackedScene = load("res://scenes/health.tscn")

var maxHealth: int = 5
var playerHealth: int = 5


func _ready():

	# Initial health ui for player
	get_tree().call_group('ui','set_health', maxHealth)
	
	
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
	meteor.connect('collision', _on_meteor_collision)

func _on_meteor_collision():
	playerHealth -= 1
	get_tree().call_group('ui','set_health', playerHealth)
	$Player.play_collision_sound()
	if playerHealth <= 0:
		get_tree().change_scene_to_packed(game_over_scene)
	
func _on_player_laser(pos):
	var laser = laser_scene.instantiate()
	$Lasers.add_child(laser)
	laser.position = pos


func _on_health_timer_timeout():
	# 2. create an instance
	var health = health_scene.instantiate()
	# 3. attach node to scene tree
	$Healths.add_child(health)
	
	health.connect('collision', _on_health_collision)
	
func _on_health_collision():
	if playerHealth != maxHealth:
		playerHealth += 1
	get_tree().call_group('ui', 'set_health', playerHealth)
