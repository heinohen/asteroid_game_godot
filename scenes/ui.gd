extends CanvasLayer


static var image = load("res://graphics/ui/playerLife1_blue.png")
var time_elapsed := 0

func _ready():
	$ScoreContainer/ScoreLabel.text = "time survived: " + str(Global.timeSurvived)
	$ScoreContainer/MeteorLabel.text = "meteors destroyed: " + str(Global.meteorsDestroyed)

func _process(_delta):
	$ScoreContainer/MeteorLabel.text = "meteors destroyed: " + str(Global.meteorsDestroyed)

func set_health(playerHealth):
	# remove all
	for child in $BottomUi/LifeContainer.get_children():
		child.queue_free()
		
	for i in playerHealth:
		var text_rect = TextureRect.new()
		text_rect.texture = image
		text_rect.stretch_mode = TextureRect.STRETCH_KEEP
		$BottomUi/LifeContainer.add_child(text_rect)


func _on_score_timer_timeout():
	time_elapsed += 1
	Global.timeSurvived = time_elapsed 
	$ScoreContainer/ScoreLabel.text = "time survived: " + str(Global.timeSurvived)
