extends CharacterBody2D

const SPEED = 300.0
var target = Vector2.ZERO
@onready var anim = get_node('AnimationPlayer')
var tow

func _physics_process(delta):
	tow = get_node("../Tower and players/Farm/TowerGrey10")#Tower and players/Farm/TowerGrey
	target = tow.position
	
	 # when click Left mouse button
	
	velocity = global_position.direction_to(target) * SPEED
	get_node("AnimatedSprite2D").flip_h = true
	if velocity.x < 0:
		get_node("AnimatedSprite2D").flip_h = true
	else:
		get_node("AnimatedSprite2D").flip_h = false
	
	if Input.is_action_just_pressed("ui_accept") :
		anim.play('Attack')
	
	if global_position.distance_to(target) < 5:
		anim.play('Idle')
		velocity = Vector2.ZERO
	elif global_position.distance_to(target) > 5:
		anim.play('Run')
	#else:
		#anim.play("Idle")

	move_and_slide()




