extends Node

#I stuck this onto a seperate Node in the floor scenes because for some reason we're applying scripts to the floor outside of the prefabs, which overwrites if I put it on the staticBody

const obj1 = preload("res://Scenes/Obstacles/Object1.tscn")

#An array that you can add the preloaded objects to
var obstacles = [obj1]

# Called when the node enters the scene tree for the first time.
func _ready():
	#Create loop for amount of spawn segments per floor tile (currently 2)
	
	"""
	
	for i in range(2):
		var spawnPos = Vector3(randf_range(-2,2), -1, randf_range(0, -7.5) * (i + 1))
		print(spawnPos)
		
		var rand = randi_range(0, obstacles.size()-1)
		print(rand)
		
		var spawnedObj = obstacles[rand].instantiate()
		add_child(spawnedObj)
		spawnedObj.position = spawnPos
		print(spawnedObj.position)
		
	"""


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
