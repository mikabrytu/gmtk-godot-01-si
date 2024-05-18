extends Node2D

@export var step: int

func _on_timer_timeout():
	position.x += step
	
