extends Area

onready var explosion = preload("res://Explode.tscn")
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
			get_parent().add_child(new_explode)
			new_explode.global_transform.origin = global_transform.origin
			queue_free()
			

