extends Node2D

var pos
var speed = Vector2(randi() % 200 + 50, randi() % 200 + 50)
var grav = 500

# Called when the node enters the scene tree for the first time.
func _ready():
	position = Vector2(10, 10)
	set_process(true)

func _process(delta):
	var pos = position
	var v =  speed
	pos.x += v.x * delta
	pos.y += v.y * delta
	v.y += grav * delta
	
	if pos.x > 1024:
		v.x *= -1
		pos.x = 1024
	if pos.x < 0:
		v.x *= -1
		pos.x = 0
	if pos.y > 600:
		pos.y = 600
		if randf() > 0.5:
			v.y = -(randi() % 1100 + 50)
		else:
			v.y *= -0.85
	if pos.y < 0:
		v.y = 0
		pos.y = 0
	position = pos
	speed = v