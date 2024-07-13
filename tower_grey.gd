extends StaticBody2D
@onready var towAnim = get_node('AnimationPlayer')
@onready var map = get_node("../../..")
var occ = "grey";
# Called when the node enters the scene tree for the first time.
func _ready():
	
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	pass


func _on_area_2d_body_entered(body):
	
	if body.name == "Troop":
		towAnim.play("blue")
		if(occ == "red"):
			map.red -= 1
			map.blue += 1
			occ = "blue"
		elif(occ == "grey"):
			map.blue+=1
			occ = "blue"
	elif body.name == "comp":
		towAnim.play("red")
		if(occ == "blue"):
			map.red += 1
			map.blue -= 1
			occ = "red"
		elif(occ == "grey"):
			map.red+=1
			occ = "red"
		
