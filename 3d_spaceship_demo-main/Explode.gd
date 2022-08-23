extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	for child in get_children():
		if child is RigidBody:
			child.apply_central_impulse(Vector3(rand_range(-100,100),rand_range(-100,100),rand_range(-100,100)))


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
