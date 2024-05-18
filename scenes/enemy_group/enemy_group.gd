extends Node2D

@export_category("Spawn Settings")
@export var size: Vector2i
@export var offset: Vector2
@export var enemy: PackedScene

@export_category("Movement")
@export var step: int
@export var step_increase: int
@export var timer_decrease: float
@export var bounce_limit: int
@export var change_threshold: int

var direction = 1
var kill_count = 0
var bounce_count = 0

func _ready():
	for x in size.x:
		for y in size.y:
			var clone = enemy.instantiate()
			clone.position = Vector2(x * offset.x, y * offset.y)
			clone.on_killed.connect(_on_enemy_killed)
			add_child(clone)
	

func _increase_difficulty():
	kill_count = 0
	bounce_count = 0
	
	$Timer.wait_time -= timer_decrease
	step += step_increase
	bounce_limit -= 1
	

func _advance():
	bounce_count += 1
	if (bounce_count > bounce_limit):
		position.y += step
		bounce_count = 0
	

func _on_timer_timeout():
	position.x += direction * step
	

func _on_screen_exited_left():
	direction = 1
	_advance()
	

func _on_screen_exited_right():
	direction = -1
	_advance()
	

func _on_enemy_killed():
	kill_count += 1
	if (kill_count > change_threshold):
		_increase_difficulty()
	
