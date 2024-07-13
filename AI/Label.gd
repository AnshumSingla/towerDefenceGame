extends Label
var tower_red_count = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var display = int(tower_red_count)

	var count_blue := str(display)
	text = count_blue

func _physics_process(delta):
	tower_red_count+=delta*1.2
	pass
