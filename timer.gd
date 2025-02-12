extends Timer

const comp := preload("res://Player/red.tscn")

func r_random() -> void:
	var red_towers := []
	red_towers = $"../../..".get_children()
	var random_red_tower_index: int = randi_range(5, 9)
	var random_red_tower: StaticBody2D = red_towers[random_red_tower_index]
	var target_position: Vector2 = random_red_tower.global_position
	var toSpawn := int(round($"../../../red_tower".enemyTower.tower_grey_count/2))
	$"../../../red_tower".enemyTower.tower_grey_count -= toSpawn
	for i in range(toSpawn):
		var troop := comp.instantiate()
		troop.global_position = Vector2($"../../../red_tower".global_position.x+i, $"../../../red_tower".global_position.y+10)
		troop.target = Vector2(target_position.x, target_position.y+10) # Use the single target position
		troop.TO = random_red_tower
		$"../../..".add_child(troop)
		troop.initialize()
