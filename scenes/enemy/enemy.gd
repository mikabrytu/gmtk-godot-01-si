extends StaticBody2D

signal on_killed


func _notification(what):
	if (what == NOTIFICATION_PREDELETE):
		on_killed.emit()
	
