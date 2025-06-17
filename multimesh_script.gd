extends MultiMeshInstance3D

@export var shape_scale: Vector3 = Vector3(0.03,0.03,1.0)

func _ready():
	var multiMesh = get_node("."). multimesh
	#var Collision_shape = CylinderShape.new()
	
	for index in multiMesh.instance_count:
		var meshTran = multiMesh.get_instance_transform(index)
		#var shape = CollisionShape.new()
		var shape = CollisionShape3D.new()
		var shapeMesh = BoxMesh.new()

		#shape.shape = multiMesh.mesh.create_trimesh_shape()
		shape.shape = shapeMesh.create_trimesh_shape()

		shape.transform.basis.x = meshTran.basis.x
		shape.transform.basis.z = meshTran.basis.z
		shape.transform.basis.y = meshTran.basis.y
		shape.scale = shape_scale
		
		shape.rotation.y = 0.0
		shape.rotation.x = 0.0
		shape.rotation.z = 0.0

		var sBody = StaticBody3D.new()
		sBody.transform = meshTran
		sBody.add_child(shape)
		add_child(sBody)

		index += 1
