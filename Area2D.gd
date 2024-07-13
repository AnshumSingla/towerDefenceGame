extends Area2D
const comp := preload("res://Player/red.tscn")
const player := preload("res://Player/blue.tscn")
var Tower_id_start = 0
var Tower_id_end = 0
var is_pressed = false
var is_active = false

# Called when the node enters the scene tree for the first time.
func _ready():
	var cx := 2000
	var px := -384
	var cy := 372
	var py := 372

	for i in range(5):
		var Cinstance := comp.instantiate()
		add_child(Cinstance)
		Cinstance.position = Vector2(cx,cy)
		cy+=20;
		var Pinstance := player.instantiate()
		add_child(Pinstance)
		Pinstance.position = Vector2(px,py)
		py+=20;
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	pass
	pass

func _on_mouse_entered():
	is_active = true
	Tower_id_start = 1

func _on_mouse_exited():
	is_active = false
	Tower_id_end = 0

func _input(event):
	if is_active:
		if event is InputEventMouseButton:
			if event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
				is_pressed = true
				Tower_id_start = 1
				
			else:
				is_pressed = false
				if mouse_entered:
					Tower_id_end = 1
					
