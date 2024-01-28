extends Button


# Called when the node enters the scene tree for the first time.
func _ready():
	disabled = true
	modulate.a = 0
	$"../bkg".modulate.a = 0
	await get_tree().create_timer(35.0).timeout # test
	
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if $"../../value_handler".get_game_state() == true:
		disabled = false
		modulate.a = 255
		$"../bkg".modulate.a = 255
	
	
	pass


func _on_pressed():
	print("restart")
	get_tree().reload_current_scene()
	
	pass # Replace with function body.
