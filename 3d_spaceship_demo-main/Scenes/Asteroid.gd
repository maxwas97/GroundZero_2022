extends Spatial

onready var field = preload("res://Asteroid_Field.tscn")

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var new_field = field.instance()
	get_parent().child(new_field)
	new_field.scale = Vector3(1,1,1)
	new_field.global_transform.origin = global_transform.origin
	new_field.emitting = true
	new_field.get_node("Spatial/AsteroidField").emitting = true
	new_field.get_node("Spatial/CPUParticles").emitting = true
	new_field.get_node("Spatial/CPUParticles2").emitting = true
	new_field.get_node("Spatial/CPUParticles3").emitting = true
	queue_free() # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
