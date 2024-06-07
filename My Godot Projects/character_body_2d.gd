extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -650.0

@onready var animated_sprite_2d = %AnimatedSprite2D

var isattacking = false

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	if (velocity.x > 1 || velocity.x > -1)&& !isattacking:
		%AnimatedSprite2D.animation = "running"
	elif (velocity.x==0 && !isattacking):
		%AnimatedSprite2D.animation = "default"
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		%AnimatedSprite2D.animation = "jumping"

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	if Input.is_action_just_pressed("attack"):
		print ("attack")
		isattacking = true
		#collsion box appear here
		%AnimatedSprite2D.play("attack")

		
	
	#animation finished here
	

	#is attacking = false
	#turn off collision box
	
	
		
		
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

	if velocity.x < 0 :
		%AnimatedSprite2D.flip_h = true
	else:
		%AnimatedSprite2D.flip_h = false
		
	 
func _on_animated_sprite_2d_animation_finished():
	print ("attack over")
	if %AnimatedSprite2D.animation == "attack":
		print ("attack over")
		%AnimatedSprite2D.stop()
		isattacking = false
		
func _on_coal_body_entered(body):
	pass # Replace with function body.


func _on_enemy_body_entered(body):
	pass # Replace with function body.


func _on_enemy_2_body_entered(body):
	pass # Replace with function body.


		


func _on_area_2d_body_shape_entered(body_rid, body, body_shape_index, local_shape_index):
	pass # Replace with function body.
