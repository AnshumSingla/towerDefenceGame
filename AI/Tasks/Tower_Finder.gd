extends BTAction

const ma := preload("res://map.tscn")
var map := ma.instantiate()
const comp := preload("res://Player/red.tscn")
const tow := preload("res://tower_grey.tscn")
var tower := tow.instantiate()
const ai := preload("res://Player/enemy_tower.tscn")
var ai_var := ai.instantiate()
var troop := comp.instantiate()
var weights := [0, 0, 0, 0, 0, 2, 30, 55, 1, 12]
var weighted_list := []

func _ready() -> void:
	for i in range(weights.size()):
		weighted_list += [i] * weights[i]
	print(weighted_list)
	# Check if ai_var is instantiated correctly
	if ai_var == null:
		print("Error: ai_var is null after instantiation.")
	else:
		print("ai_var instantiated successfully.")

func _tick(_delta: float) -> void:
	target_selector()

func target_selector() -> Status:
	var tower_label := tower.get_node("Label")
	if tower_label and tower.occ == "grey" and tower.tower_grey_count < (ai_var.get("tower_grey_count") / 2):
		var tt := map.get_node("Tower and players")
		var tf := tt.get_node("Farm").get_child(random_weighted())
		if tt:
			tt.FROM_TOWER = ai_var
			gen_troops(tt.FROM_TOWER, tf, tt.FROM_TOWER.global_position, tf.global_position)
			return RUNNING
	return SUCCESS

func random_weighted() -> int:
	var index := randi() % weighted_list.size()
	return weighted_list[index]

func gen_troops(from: StaticBody2D, to: StaticBody2D, _from: Vector2, _to: Vector2) -> void:
	if from.occ == "red":
		if from == to: return
		var toSpawn := int(round(from.tower_grey_count / 2))
		from.tower_grey_count -= toSpawn
		for i in range(toSpawn):
			troop = comp.instantiate()
			troop.global_position = Vector2(_from.x + i, _from.y + 10)
			troop.target = Vector2(_to.x, _to.y + 10)
			troop.TO = to
			map.add_child(troop)
			troop.initialize()
