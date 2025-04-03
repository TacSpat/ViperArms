extends Panel
signal show_focused_content

@export var obj_name = "Default Object"
@export_multiline var obj_description = "If you are seeing this. You forgot to set me!"

func _on_focus_entered() -> void:
	self_modulate = Color("ffffff")
	emit_signal("show_focused_content",obj_name,obj_description)


func _on_focus_exited() -> void:
	self_modulate = Color("000000")
