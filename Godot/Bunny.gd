extends Node2D

var v = Vector2(randi() % 200 + 50, randi() % 200 + 50)
const ay = 980
var pos

# Called when the node enters the scene tree for the first time.
func _ready():
	position = Vector2(10, 10)
	pos = position
	set_process(true)

func _process(delta):
	v.y += ay * delta
	pos += v * delta
	
	if pos.y > 568:
		v.y *= -0.85 
		pos.y = 568
		if randf() > 0.5:
			v.y = -rand_range(32,1150)
	elif pos.y < 0:
		v.y = 0
		pos.y = 0
	elif pos.x > 1000:
		v.x = -v.x
		pos.x = 1000
	elif pos.x < 0:
		v.x = abs(v.x)
		pos.x = 0
	position = pos