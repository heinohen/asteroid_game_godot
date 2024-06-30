extends CharacterBody2D

@export var speed := 500
@export var health := 100

# Called when the node enters the scene tree for the first time.
func _ready(): 
	position = Vector2(100,600)



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction = Input.get_vector("left","right","up","down")
	velocity = direction * speed
	move_and_slide()
	
func decrease_health():
	# by hit decrease by 10
	if health > 10:
		health -= 10
	else:
		health = 0
		print("dead")
