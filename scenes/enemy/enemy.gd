extends StaticBody2D

@export var bullet: PackedScene

signal on_killed


func _notification(what):
	if (what == NOTIFICATION_PREDELETE):
		on_killed.emit()
	

func can_shoot() -> bool:
	return !$RayCast2D.is_colliding()
	

func shoot():
	var clone = bullet.instantiate()
	clone.position = $Marker2D.position
	clone.set_direction(Vector2.DOWN)
	add_child(clone)
	clone.reparent(get_tree().root)
	
