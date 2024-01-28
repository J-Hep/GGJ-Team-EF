extends Node

#I stuck this onto a seperate Node in the floor scenes because for some reason we're applying scripts to the floor outside of the prefabs, which overwrites if I put it on the staticBody

#An array that you can add the preloaded objects to
@export var obstacles: Array[CollisionShape3D]

# Called when the node enters the scene tree for the first time.
func _ready():
	
	for i in range(obstacles.size()):
		obstacles[i].position.x = randf_range(-2,2)
	
	
	#Create loop for amount of spawn segments per floor tile (currently 2)
	"""
	var parent = get_parent()
	
	for i in range(2):
		var spawnPos = Vector3(randf_range(-2,2), -1, randf_range(0, -7.5) * (i + 1))
		print(spawnPos)
		
		var rand = randi_range(0, obstacles.size()-1)
		print(rand)
		
		var spawnedObj = obstacles[rand].instantiate()
		spawnedObj.position = spawnPos
		parent.add_child(spawnedObj)
		print(spawnedObj.position)
	"""
		
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
