extends Area2D

@export var direction: Vector2
@export var speed = 400


func _physics_process(delta):
	position += direction * speed * delta
	

func _on_screen_exited():
	queue_free()
	
