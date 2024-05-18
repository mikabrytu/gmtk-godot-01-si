extends CharacterBody2D

@export var speed = 400
@export var bullet: PackedScene
@export var spawn_point: Marker2D


func _process(delta):
	if (Input.is_action_just_pressed("action_fire")):
		_spawn_bullet()
	

func _physics_process(delta):
	get_input(delta)
	move_and_slide()
	

func get_input(delta):
	var input_direction = -(Input.get_action_strength("action_left") - Input.get_action_strength("action_right"))
	velocity.x = input_direction * speed
	

func _spawn_bullet():
	var clone = bullet.instantiate()
	clone.position = spawn_point.position
	add_child(clone)
	clone.reparent(get_tree().root)
	
