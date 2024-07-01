extends Control

var level_scene: PackedScene = load("res://scenes/level.tscn")

func _ready():
	$CenterContainer/VBoxContainer/GameOver.text = "GAME OVER"
	$CenterContainer/VBoxContainer/Score.text = "You survived " + " " + str(Global.timeSurvived) + " " + "seconds and destroyed " + str(Global.meteorsDestroyed) + " " + "meteors !" 

func _input(event):
	if event.is_action_pressed("shoot"):
		get_tree().change_scene_to_packed(level_scene)
