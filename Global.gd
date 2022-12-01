extends Node

var VP = null
var partsCollected = 0


func _ready():
	pause_mode = Node.PAUSE_MODE_PROCESS

func _unhandled_input(event):
	if event.is_action_pressed("menu"):		
		var Pause_Menu = get_node_or_null("/root/Game/UI/Pause_Menu")
		if Pause_Menu == null:
			get_tree().quit()
		else:
			if Pause_Menu.visible:
				get_tree().paused = false
				Pause_Menu.hide()
			else:
				get_tree().paused = true 
				Pause_Menu.show()

func add_part(type):
	var HUD = get_node_or_null("/root/Game/UI/HUD")
	if HUD != null:
		HUD.add_part(type)
		
func reset():
	var _scene = get_tree().change_scene("res://Game.tscn")
	var new_dialogue = Dialogic.start("Start")
	add_child(new_dialogue)
	partsCollected = 0
