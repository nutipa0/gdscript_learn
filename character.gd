class_name Character

extends Node

@export var profession: String
@export var health: int

class Equipment:
	var armor: int = 10
	var cha

func die():
	health = 0
	print(profession + " died.")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
