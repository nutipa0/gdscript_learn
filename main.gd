extends Node

var health: int = 100

signal hp_changed(new_health)
var hp: int = 100:
	set(value):
		hp = clamp(value, 0, 100)
		hp_changed.emit(hp)

enum Alignment { ALLY, NEUTRAL, ENEMY }

@export var my_alignment: Alignment
#@export var unit_alignment = Alignment.ALLY

#@onready var weapon: Sprite2D = $Player/Weapon
@export var my_node: Node
@export var my_sprite: Sprite2D

signal leveled_up(msg: String)
var xp: int = 0

var chance: float = 0.2
var chance_pct: int:
	get:
		return chance * 100
	set(value):
		chance = float(value) / 100.0

@export var character_to_kill: Character

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("こんにちは")
	#health = 40
	$Label.text = "日本語ではありません"
	$Label.modulate = Color.GREEN
	var position = Vector3(3, -10, 5)
	position.x += 2
	var character_height = randi_range(180, 210)
	print("The character is " + str(character_height) + "cm height")
	var items: Array[String] = ["Posion", "Feather", "Stolen harp"]
	print(items[0])
	items[1] = "Smelly sock"
	items.remove_at(2)
	items.append("Overpowered sword")
	
	for item in items:
		if item.length() > 6:
			print(item)
		else:
			print("Less than 6 letters")
			
	for n in 8:
		print(n)
	
	var glass: float = 0.0
	while glass < 0.5:
		glass += randf_range(0.01, 0.2)
		if glass > 0.2:
			break
		print(glass)
	print("The glass is now half full!")
	
	var players = {
		"Crock": {
			"Level": 1, 
			"Health": 80
		}, 
		"Villain": 35, 
		"Boss": 100
	}
	
	print(players["Villain"])
	players["Villain"] = 50
	players["Dwayne"] = 999
	
	for username in players:
		print(username + ": " + str(players[username]))
		
	print(players["Crock"]["Health"])
	
	#if unit_alignment == Alignment.ENEMY:
		#print("You are not welcome here")
	#else:
		#print("Welcome")
		
	hp = -150
	
	match  my_alignment:
		Alignment.ALLY:
			print("Hello, friend")
		Alignment.NEUTRAL:
			print("I come in piece")
		Alignment.ENEMY:
			print("TASTE MY WRATH!")
		_:
			print("Who art thou?")
	
	if my_node is Node2D:
		print("Is 2D")
		
	leveled_up.connect(_on_leveled_up)
	print(chance_pct)
	chance_pct = 40
	print(chance_pct)
	character_to_kill.die()

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

func _on_button_pressed() -> void:
	print("You clicked a button")


func _on_timer_timeout() -> void:
	xp += 5
	print(xp)
	if xp >= 20:
		xp = 0
		leveled_up.emit("GZ!")

func _on_leveled_up(msg: String) -> void:
	print(msg)


func _on_hp_changed(new_health: Variant) -> void:
	print(new_health)
