extends Control


func select_focused():
	pass
	
func _on_visibility_changed() -> void:
	if visible:
		$Bg/Contents/Panel.grab_focus()
		show_focused_content($Bg/Contents/Panel.obj_name,$Bg/Contents/Panel.obj_description)
		
func show_focused_content(obj_name, obj_description):
	if obj_name != "Default Object":
		$Bg/Description.set_description(obj_name,obj_description)
