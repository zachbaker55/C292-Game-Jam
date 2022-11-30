extends KinematicBody2D

var velocity = Vector2()
var speed = 50

onready var sprite = $AnimatedSprite

func _ready():
	pass
	
func _physics_process(delta):
	var direction = Vector2(Input.get_action_strength("right") - Input.get_action_strength("left"),
	Input.get_action_strength("down") - Input.get_action_strength("up")).normalized()
	move_and_slide(direction * speed)
	if (direction != Vector2.ZERO):
		sprite.animation =  "walk"
	else:
		sprite.animation = "idle"

