extends KinematicBody2D

var velocity = Vector2()
var speed = 400

var movement = false

onready var timer = $Timer
onready var sprite = $AnimatedSprite
onready var getPart = $GetPart

func _ready():
	pass
	
func _physics_process(_delta):
	var direction = Vector2(Input.get_action_strength("right") - Input.get_action_strength("left"),
	Input.get_action_strength("down") - Input.get_action_strength("up")).normalized()
	if (movement == true):
		if (direction != Vector2.ZERO):
			sprite.animation =  "walk"
			var _moved = move_and_slide(direction * speed)
		else:
			sprite.animation = "idle"

func stop_moving():
	movement = false
	sprite.animation = "idle"
	
func start_moving():
	sprite.animation = "idle"
	movement = true

func get_part(type):
	sprite.animation =  "getItem"
	getPart.get_child(int(type)).visible = true
	Global.add_part(type)
	Global.partsCollected += 1
	timer.start(3)
	
	
func happy():
	sprite.animation = "walk"


func _on_Timer_timeout():
	sprite.animation = "idle"
	for i in range(0,6):
		getPart.get_child(i).visible = false
	movement = true
