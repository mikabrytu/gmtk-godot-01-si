extends CharacterBody2D

@export var speed = 400


func get_input():
	var input_direction = -(Input.get_action_strength("action_left") - Input.get_action_strength("action_right"))
	velocity.x = input_direction * speed
	

func _physics_process(delta):
	get_input()
	move_and_slide()
	
