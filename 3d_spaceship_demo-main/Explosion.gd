extends RigidBody
#doesn't have to be area node can be rigidbody
export var explosion_decal : Resource
export var explosion_particles : Resource
export var explosion_force : int = 30

var items_in_radius : Array


func _ready():
	randomize()
	
	
func _on_Area_body_entered(body):
	if body.name != self.name:
		if body is RigidBody:
			items_in_radius.append(body)


func _on_Area_body_exited(body):
	if body is RigidBody:
		items_in_radius.erase(body)
		
func explosion():
	var force_dir : Vector3
	var random_vector : Vector3
	
	
	for i in items_in_radius:
		if i.is_in_group("breakable"):
			i.break_object()
			
			
			
			
	yield(get_tree().create_timer(0.04), "timeout")
	
	
	for j in items_in_radius:
		force_dir = self.translation.direction_to(j.translation)
		random_vector = Vector3(rand_range(0,1), rand_range(0,1), rand_range(0,1)) * force_dir
		j.apply_impulse(random_vector, force_dir * explosion_force)
		
		
func _on_Timer_Timeout():
	explosion()
	
	
	var decal = explosion_decal.instance()
	self.get_parent().add_child(decal)
	decal.translation = self.translation
	decal.translation.y = 02
	
	var particles = explosion_particles.instance()
	self.get_parent().add_child(particles)
	particles.translation = self.translation
	particles.emitting = true
# Declare member variables here. Examples:
# var a = 2
# var b = "text"



# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
