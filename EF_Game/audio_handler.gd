extends Node
var lostBounce = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	#infinite sound loops
	if $"../value_handler".get_game_state() == false:
		if $"Rolling".playing == false:
			$"Rolling".playing = true
			
		if $"Raccoon1".playing == false:
			$"Raccoon1".playing = true
		
		if $"Squeaky".playing == false:
			$"Squeaky".playing = true
	else:
		if lostBounce == false:
			for i in get_children():
				i.playing = false
			lostBounce = true
			
			#Death noise
			$"pipe".playing = true
			
		
		
	pass
