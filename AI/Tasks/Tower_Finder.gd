extends BTAction

const ma := preload("res://map.tscn")
const comp := preload("res://Player/red.tscn")
const tow := preload("res://tower_grey.tscn")
var ai := preload("res://Player/enemy_tower.tscn")
var map := ma.instantiate()
var tower := tow.instantiate()
var ai_var := ai.instantiate()
var troop := comp.instantiate()
var weights := [0, 0, 0, 0, 0, 2, 30, 55, 1, 12]
var weighted_list := []

func _ready() -> void:
	pass

func _tick(_delta: float) -> void:
	if ai_var:
		target_selector()
		print("success")
	for i in range(weights.size()):
		weighted_list.append( i * weights[i])
	#print(weighted_list)

func target_selector() -> Status:
	#if tower.tower_grey_count < ((ai.enemyTower.tower_grey_count) / 2):
		#var tt := map.get_node("Tower and players")
		#var tf := tt.get_node("Farm").get_child(random_weighted())
		#print("tf: ", tf)
		#if tt:
			#tt.FROM_TOWER = ai_var
			#gen_troops(tt.FROM_TOWER, tf, tt.FROM_TOWER.global_position, tf.global_position)
			#return RUNNING
			#print("c")
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
