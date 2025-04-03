extends ColorRect

@export var item_name = "Placeholder Name"
@export_multiline var item_description: String = """LoremIspumTheDevsAreAwesomeGibberishBlaBLaBla"""

func _ready() -> void:
	set_description(item_name, item_description)

func set_description(objname = "Placeholder Name", description = """LoremIspumTheDevsAreAwesomeGibberishBlaBLaBla"""):
	$ItemName.text = objname + ":"
	$ItemDescription.text = description
