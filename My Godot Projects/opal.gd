extends Area2D



func _on_body_entered(body):
	if (body.name == "CharacterBody2D"):
		get_tree().change_scene_to_file("res://main_menu.tscn")
		queue_free()
