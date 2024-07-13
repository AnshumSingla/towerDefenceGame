extends CharacterBody2D

const ME = "red"
const SPEED = 300.0
var target := Vector2.ZERO
@onready var anim := get_node('AnimationPlayer')

func _physics_process(delta: float) -> void:
	velocity = global_position.direction_to(target) * SPEED
	get_node("AnimatedSprite2D").flip_h = true
	if velocity.x < 0:
		get_node("AnimatedSprite2D").flip_h = true
	else:
		get_node("AnimatedSprite2D").flip_h = false
	
	if Input.is_action_just_pressed("ui_accept") :
		anim.play('Attack')
	
	if global_position.distance_to(target) < 20:
		anim.play('Idle')
		velocity = Vector2.ZERO
	elif global_position.distance_to(target) > 20:
		anim.play('Run')
	move_and_collide(velocity*delta)
