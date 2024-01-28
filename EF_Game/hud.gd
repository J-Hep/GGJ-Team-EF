extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	
	
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$"TextureRect".rotation = $"../value_handler".get_time()
	$"Label".text = str($"../value_handler".get_coins())
	#$"../value_handler".get_coins()
	
	pass
