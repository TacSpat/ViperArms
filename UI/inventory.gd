extends Control


func select_focused():
	pass
	
func _on_visibility_changed() -> void:
	if visible:
		$Bg/Contents/Panel.grab_focus()
