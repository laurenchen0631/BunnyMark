extends Control

var NODE_fps
var NODE_bunnyCount
var bunnyCount = 0
var elapsed = 0
var BunnySpawnIterator
var BunnyInstance
var bunny = preload('res://bunny.tscn')

# Called when the node enters the scene tree for the first time.
func _ready():
	NODE_fps = get_node("fps")
	NODE_bunnyCount = get_node("BunnyCounter")
	set_process(true)
	addBunny(1)

func _process(delta):
	if Input.is_action_pressed("ui_up"):
		addBunny(10)
		
	elapsed = elapsed + delta
    # Update fps text once per second
	if elapsed > 1:
		NODE_fps.set_text("FPS: " + str(Engine.get_frames_per_second()))
		NODE_fps.set_as_toplevel(1)
		NODE_bunnyCount.set_as_toplevel(1)
		elapsed = 0

func addBunny(num):
	BunnySpawnIterator = 0
	while BunnySpawnIterator < num:
		BunnySpawnIterator += 1
		BunnyInstance = bunny.instance()
		add_child(BunnyInstance)
		bunnyCount = bunnyCount + 1
	NODE_bunnyCount.set_text("Bunnies: " + str(bunnyCount))