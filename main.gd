extends Node2D

@onready var playerWhite = get_node("Player White")
@onready var playerBlack = get_node("Player Black")
@onready var whiteStage = get_node("White")
@onready var blackStage = get_node("Black")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if (Input.is_action_just_pressed('shift_dimension')): 
		_shift_dimension()
	
func _shift_dimension(): 
	if (DimensionBus.isWhiteCurrent()) : 
#		$White/StaticBody2D/CollisionShape2D.set_deferred("disabled", false)
#		$Black/StaticBody2D/CollisionShape2D.set_deferred("disabled", true)
		DimensionBus.currentDimension = DIMENSION.BLACK_DIMENSION
		whiteStage.emit_signal("shiftDimension")
		blackStage.emit_signal("shiftDimension")
		playerWhite.emit_signal("shiftDimension")
		playerBlack.emit_signal("shiftDimension")
		
	else: 
#		$Black/StaticBody2D/CollisionShape2D.set_deferred("disabled", false)
#		$White/StaticBody2D/CollisionShape2D.set_deferred("disabled", true)
		DimensionBus.currentDimension = DIMENSION.WHITE_DIMENSION
		whiteStage.emit_signal("shiftDimension")
		blackStage.emit_signal("shiftDimension")
		playerWhite.emit_signal("shiftDimension")
		playerBlack.emit_signal("shiftDimension")
