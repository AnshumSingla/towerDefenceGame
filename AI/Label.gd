extends Label
var troop_count: float = 0
var count := int(troop_count)

func _process(delta: float) -> void:
	count = int(troop_count)
	text = str(count)
	print("troop_count: = ", troop_count)

func _physics_process(delta: float) -> void:
	if(troop_count <= 40):
		troop_count += delta/1.2
