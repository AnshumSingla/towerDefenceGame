extends CharacterBody2D
var behavior_tree: BehaviorTree
const ME = "red"
const SPEED = 150.0
var target: Vector2
@onready var anim := get_node('AnimationPlayer')
@onready var navigation_agent_2d := $NavigationAgent2D
var TO: StaticBody2D = null


func _ready() -> void:
	pass

func initialize() -> void:
	if target:
		$NavigationAgent2D.target_position = target

func _physics_process(delta: float) -> void:
	if not TO:
		return
	var dir: Vector2 = $NavigationAgent2D.get_next_path_position() - global_position
	dir = dir.normalized()

	if dir != Vector2.ZERO:
		velocity = velocity.lerp(dir * SPEED, 1)
		get_node("AnimatedSprite2D").flip_h = true
		if dir.x < 0:
			get_node("AnimatedSprite2D").flip_h = true
		else:
			get_node("AnimatedSprite2D").flip_h = false

	if self.position.distance_to(dir) < 20:
		anim.play('Idle')
	else:
		anim.play('Run')

	move_and_slide()

func _on_timer_timeout()->void:
	navigation_agent_2d.target_position = target
