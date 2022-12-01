extends KinematicBody2D

var completed = false

func _on_Area2D_body_entered(_body):
	if (completed == false):
		var new_dialogue = Dialogic.start(self.name)
		add_child(new_dialogue)
		var Player = get_node_or_null("/root/Game/Player")
		if Player != null:
			Player.stop_moving()
			
			
			
func complete():
	completed = true
