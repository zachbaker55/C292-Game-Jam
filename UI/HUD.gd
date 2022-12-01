extends Control


var part_pos = Vector2(32,32)
var part_index = 48
onready var Part = load("res://UI/CollectedPart.tscn")
	
func add_part(type):
	print(type)
	var collectedPart = Part.instance()
	collectedPart.position = part_pos
	part_pos.x = part_pos.x + part_index
	collectedPart.get_child(int(type)).visible = true
	$PartContainer.add_child(collectedPart)
