extends CharacterBody2D

const SPEED := 300.0
var target := Vector2.ZERO
@onready var anim := get_node('AnimationPlayer')

func _physics_process(delta: float) -> void:
	if Input.is_mouse_button_pressed(1): # when click Left mouse button
		target = get_global_mouse_position()
	velocity = global_position.direction_to(target) * SPEED
	
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
	#else:
		#anim.play("Idle")

	move_and_slide()
