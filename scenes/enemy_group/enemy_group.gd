extends Node2D

@export var step: int

var direction = 1

func _on_timer_timeout():
	position.x += direction * step
	

func _on_screen_exited_left():
	direction = 1
	

func _on_screen_exited_right():
	direction = -1
	
