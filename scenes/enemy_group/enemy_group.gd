extends Node2D

@export_category("Spawn Settings")
@export var size: Vector2i
@export var offset: Vector2
@export var enemy: PackedScene

@export_category("Movement")
@export var step: int

var direction = 1

func _ready():
	for x in size.x:
		for y in size.y:
			var clone = enemy.instantiate()
			clone.position = Vector2(x * offset.x, y * offset.y)
			add_child(clone)
	

func _on_timer_timeout():
	position.x += direction * step
	

func _on_screen_exited_left():
	direction = 1
	

func _on_screen_exited_right():
	direction = -1
	
