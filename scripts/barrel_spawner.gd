extends Area3D


var barrel_scene = load("res://pickable_barrel.tscn")

@onready var collision_shape : CollisionShape3D = $CollisionShape3D

func _physics_process(delta: float):
	var barrels_nodes : Array[Node3D] =  get_overlapping_bodies()
	#print("Barrels count: ", len(barrels_nodes))
	if len(barrels_nodes) < 6:
		var barrel = barrel_scene.instantiate()
		var offset = Vector3(randf_range(-0.5,0.5),0,randf_range(-0.2,0.2))
		barrel.position = offset
		add_child(barrel)
		#print("Added barrel!")
		pass
	pass
