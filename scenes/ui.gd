extends CanvasLayer


static var image = load("res://graphics/ui/playerLife1_blue.png")

func set_health(playerHealth):
	print(playerHealth, ' from the ui')
	
	# remove all
	for child in $BottomUi/LifeContainer.get_children():
		child.queue_free()
		
	for i in playerHealth:
		var text_rect = TextureRect.new()
		text_rect.texture = image
		text_rect.stretch_mode = TextureRect.STRETCH_KEEP
		$BottomUi/LifeContainer.add_child(text_rect)
