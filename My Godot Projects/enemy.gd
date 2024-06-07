extends Area2D

func take_damage():
	%AnimatedSprite2D.animation = "hit"
	var t = Timer.new()
	t.set_wall.time(0,1)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()
	%AnimatedSprite2D.animation = "dead"
	t.set_wall.time(0,5)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()
	t.queue_free()
	queue_free()

func _on_body_entered(body):
	if (body.name == "%AnimatedSprite2D"):
		queue_free()

