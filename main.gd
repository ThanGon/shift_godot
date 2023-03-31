extends Node2D

enum DIMENSION {BLACK_DIMENSION, WHITE_DIMENSION}

var currentDimension = DIMENSION.BLACK_DIMENSION;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if (Input.is_action_just_pressed('shift_dimension')): 
		_shift_dimension()
	
func _shift_dimension(): 
	if (currentDimension == DIMENSION.BLACK_DIMENSION) : 
		$White/StaticBody2D/CollisionShape2D.set_deferred("disabled", false)
		$"Player/Player Body".up_direction = Vector2.DOWN
		$"Player/Player Body".JUMP_VELOCITY = 400 # GRAVITY IS PULLING DOWNWARD
		$Black/StaticBody2D/CollisionShape2D.set_deferred("disabled", true)
		currentDimension = DIMENSION.WHITE_DIMENSION
		
	elif (currentDimension == DIMENSION.WHITE_DIMENSION) : 
		$Black/StaticBody2D/CollisionShape2D.set_deferred("disabled", false)
		$"Player/Player Body".up_direction = Vector2.UP
		$"Player/Player Body".JUMP_VELOCITY = -400 # GRAVITY IS PULLING DOWNWARD
		$White/StaticBody2D/CollisionShape2D.set_deferred("disabled", true)
		currentDimension = DIMENSION.BLACK_DIMENSION
