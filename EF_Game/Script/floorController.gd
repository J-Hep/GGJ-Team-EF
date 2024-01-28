extends StaticBody3D

var speed = 4
var angle = 15 #floors are set at a 15 degree angle and so move upwards at 15 degree (not radians)
var axis = Vector3(0, 1, 1)
var direction = Vector3(0, 0, 1).rotated(axis, deg_to_rad(angle))
var chunkSize = 15 #set this to be the size of our floor, it can be bigger once we have art assets

var prefabTypes = [preload("res://Assets/3D/floor1.tscn"), preload("res://Assets/3D/floor2.tscn"), preload("res://Assets/3D/floor3.tscn"), preload("res://Assets/3D/floor4.tscn"), preload("res://Assets/3D/floor5.tscn"), preload("res://Assets/3D/floor6.tscn")]
var spawnPosition = Vector3(0, -8.072, -30.125) #math wasn't mathing so i threw numbers in
#var spawnPosition = Vector3(0, (-2*chunkSize) * sin(deg_to_rad(angle)), (-2*chunkSize) * cos(deg_to_rad(angle)))
var xAxis = Vector3(1, 0, 0)

var newChunk = null

func _ready():
	# change the speed here
	# maybe something like speed += value_handler.ge_time() / 20   #idk how the syntax for getting variables from other scripts are
	var path = "/root/BaseWorld/value_handler"
	var values = $"../value_handler"
	speed += values.get_time() / 20
	pass

func _physics_process(delta):
	var movement = direction * speed * delta
	translate(movement)
	var destination_reached = position.z > chunkSize*cos(deg_to_rad(angle))
	if(destination_reached):
		_on_destination_reached()

func _on_destination_reached():
	position = spawnPosition
	newChunk = prefabTypes[randi() % prefabTypes.size()].instantiate()
	var parent = get_parent_node_3d()
	var script = load("res://Script/floorController.gd")
	var objScript = load("res://objectmover.gd")
	if objScript != null:
		print("script got")
	
	newChunk.set_script(script)
	newChunk.transform.basis = Basis(xAxis, deg_to_rad(-angle))
	newChunk.position = spawnPosition
	
	if newChunk.get_node("Node"):
		newChunk.get_node("Node").set_script(objScript) # says script is in, breaks if i dont do this even if its true everytime
	
	parent.add_child(newChunk)
	get_node(".").queue_free()
	newChunk = null
