extends Node2D

onready var Dinner = load("res://NPC/Dinner.tscn")

func _on_Area2D_body_entered(_body):
	if Global.partsCollected >= 6:
		var Player = get_node_or_null("/root/Game/Player")
		if Player != null:
			Player.stop_moving()
		var new_dialogue = Dialogic.start("End")
		add_child(new_dialogue)
		
func happy():
	$DinnerContainer/Dinner/Sprite.animation = "happy"
	

func make_Dinner():
	var DinnerInstance = Dinner.instance()
	DinnerInstance.visible = true
	$DinnerContainer.add_child(DinnerInstance)
