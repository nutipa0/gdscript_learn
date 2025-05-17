extends Node

var health = 100

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("こんにちは")
	#health = 40
	$Label.text = "日本語ではありません"
	$Label.modulate = Color.GREEN
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("color_change"):
		health -= 20
		print(health)
		
		if health <= 0:
			health = 0
			print("You died")
		elif health < 50:
			print("Your health is about less than 50")
		else:
			print("You are healthy!")
		$Label.modulate = Color.RED
			
	if event.is_action_released("color_change"):
		$Label.modulate = Color.GREEN
