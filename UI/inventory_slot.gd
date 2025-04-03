extends Panel


func _on_focus_entered() -> void:
	self_modulate = Color("ffffff")


func _on_focus_exited() -> void:
	self_modulate = Color("000000")
