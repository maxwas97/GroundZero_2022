extends Area

onready var explosion = preload("res://Scenes/Explosion2.tscn")
var planet_hp = 300
var score = 0

func _ready():
	pass


func create_explosion_particles():
	pass
	#create a particle effecet with explosion


func _on_Planet_area_entered(area):
	if area.is_in_group("Laser"):
		planet_hp -= 20
		if planet_hp <=0:
			GameManager.score +=100
			var new_explode = explosion.instance()
			get_parent().child(new_explode)
			new_explode.scale = Vector3(150,150,150)
			new_explode.global_transform.origin = global_transform.origin
			new_explode.emitting = true
			new_explode.get_node("Spatial/CPUParticles").emitting = true
			queue_free()
			

