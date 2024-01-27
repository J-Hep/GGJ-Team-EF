extends StaticBody3D

var speed = 4
var angle = 15
var axis = Vector3(0, 1, 1)
var direction = Vector3(0, 0, 1).rotated(axis, deg_to_rad(angle))
var chunkSize = 15.85

var prefabTypes = [preload("res://Assets/3D/floor1.tscn"), preload("res://Assets/3D/floor2.tscn"), preload("res://Assets/3D/floor3.tscn")]
var spawnPosition = Vector3(0, -4.1411*2, -15.455*2)
var xAxis = Vector3(1, 0, 0)

var newChunk = null

func _physics_process(delta):
	var movement = direction * speed * delta
	translate(movement)
	var destination_reached = position.y > chunkSize*sin(deg_to_rad(angle))
	if(destination_reached):
		_on_destination_reached()

func _on_destination_reached():
	position = spawnPosition
	newChunk = prefabTypes[randi() % prefabTypes.size()].instantiate()
	var parent = get_parent_node_3d()
	var script = load("res://Script/floorController.gd")
	newChunk.set_script(script)
	newChunk.transform.basis = Basis(xAxis, deg_to_rad(-angle))
	newChunk.position = spawnPosition
	parent.add_child(newChunk)
	get_node(".").queue_free()
	newChunk = null
