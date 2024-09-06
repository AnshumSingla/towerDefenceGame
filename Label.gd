extends Label

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta:float) -> void:
	text = str(int($"..".tower_grey_count))

func _physics_process(delta: float) -> void:
	if $"..".occ != "grey":
		if($"..".tower_grey_count <= 40):
			$"..".tower_grey_count += delta/1.2
