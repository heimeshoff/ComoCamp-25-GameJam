extends CharacterBody2D

var speed := 800.0
var acceleration := 128.0

var collectied_stickies := 0


func _process(_delta: float) -> void:
	move_and_slide()
	render_stickies(collectied_stickies)
	var direction = get_direction()
	velocity = direction.normalized() * speed


func get_direction() -> Vector2:
	var direction = Vector2.ZERO
	
	if Input.is_action_pressed("ui_down"):
		direction.y = 1
	elif Input.is_action_pressed("ui_up"):
		direction.y = -1
	else: 
		direction.y = 0
		
	if Input.is_action_pressed("ui_right"):
		direction.x = 1
	elif Input.is_action_pressed("ui_left"):
		direction.x = -1
	else: 
		direction.x = 0
	return direction


func render_stickies(amount:int) -> void:
	$Label.text = str(amount) + " Stickies"

func _on_pickup_body_entered(body: Node2D) -> void:
	collectied_stickies += 1
	body.queue_free()
