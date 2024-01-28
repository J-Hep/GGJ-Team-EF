extends Node

#@export var health: int
@export var coins: int
@export var distance: int
@export var time: float
@export var gameState: bool

# Called when the node enters the scene tree for the first time.
func _ready():
	#health = 3
	coins = 0
	distance = 0
	time = 0
	gameState = false
pass # Replace with function body.

func add_coins(amount: int):
	coins = coins + amount

func set_coins(amount: int):
	coins = amount

func set_distance(amount: int):
	distance = amount
	
func set_time(amount: int):
	time = amount

func set_game_state(state: bool):
	gameState = state



func get_coins():
	return coins

func get_distance():
	return distance
	
func get_time():
	return time

func get_game_state():
	return gameState
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	time += delta
	pass
