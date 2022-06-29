extends RigidBody
#doesn't have to be area node can be rigidbody or vice versa

#setting a breakable scene
export var resource : Resource

func _ready():
	add_to_group("breakable")

func break_object():
	#instancing the breakable
	var breakable = resource.instance()
	#getting parent of the area/rigidbody node
	var parent = self.get_parent()
	#adding breakable as child of parent
	parent.add_child(breakable)
	#setting breakable's translation and rotation to the node
	breakable.translation = self.translation
	breakable.rotation_degrees = self.rotation_degrees
	for i in breakable.get_children():
		i.set_as_toplevel(true)
	#Deleting the area node
	self.queue_free()
	pass
	
