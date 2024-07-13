extends Area2D
const comp := preload("res://Player/red.tscn")
const player := preload("res://Player/blue.tscn")
var is_active := false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_mouse_entered() -> void:
	is_active = true

func _on_mouse_exited() -> void:
	is_active = false

func _input(event: InputEvent) -> void:
	if is_active and event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT:
			var parent := $"../../.."
			if event.is_pressed():
				parent.FROM_TOWER = $".."
			elif  event.is_released():
				gen_troops(parent.FROM_TOWER, $"..")

func gen_troops(from: StaticBody2D, to: StaticBody2D) -> void:
	if from == to:
		return
	print_debug("From: ", from.position, "To: ", to.position)
	var parent := $"../../.."
	for i in range(10):
		var troop := player.instantiate()
		troop.position = Vector2(from.position.x+i, from.position.y-10)
		troop.target = Vector2(to.position.x, to.position.y+100)
		parent.add_child(troop)
