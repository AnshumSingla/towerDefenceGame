extends StaticBody2D
@onready var towAnim := $AnimatedSprite2D
@onready var map := $"../../.."
var occ := "grey";
var Tower_id_start = 0
var Tower_id_end = 0
var tower_grey_count = 10
var is_pressed = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	towAnim.play("default")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	pass

func _on_area_2d_body_entered(body: Node2D) -> void:
	if not body is CharacterBody2D:
		return
	if body.ME == occ:
		tower_grey_count+=1
		body.queue_free()
		return
	if tower_grey_count == 0:
		match occ:
			"blue":
				map.blue -= 1
			"red":
				map.red -= 1
		occ = body.ME
		match body.ME:
			"blue":
				map.blue += 1
			"red":
				map.red += 1
	else:
		tower_grey_count -= 1
		return
	towAnim.play(occ)
	body.queue_free()
	
