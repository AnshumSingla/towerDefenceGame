extends Node2D

@onready var enemyTower := $"StaticBody2D2"
var troop_count: float = 0

func _ready() -> void:
	enemyTower.occ = "red"
	enemyTower.tower_grey_count = 10
	$"StaticBody2D2/AnimatedSprite2D".play(enemyTower.occ)
