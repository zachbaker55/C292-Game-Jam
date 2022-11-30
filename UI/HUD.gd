extends Control


var part_pos = Vector2(16,-208)
var part_index = 24
onready var Part = load("res://UI/CollectedPart.tscn")
	
func add_part(type):
	print("got here")
	var collectedPart = Part.instance()
	collectedPart.position = part_pos
	part_pos.x = part_pos.x + part_index
	collectedPart.get_child(type).visible = true
	$PartContainer.add_child(collectedPart)
