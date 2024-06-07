extends Area2D

@onready var game_manager = %"game manager"

func _on_body_entered(body):
	if (body.name == "CharacterBody2D"):
		queue_free()
		game_manager.add100_points()
		
