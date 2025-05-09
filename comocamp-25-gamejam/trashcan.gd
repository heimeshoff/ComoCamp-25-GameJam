extends StaticBody2D


var dropped_stickies := 0

func _ready() -> void:
	%Player.DropOff.connect(func(v): 
		dropped_stickies += v
		$AnimationPlayer.play("coin")
		)
	

func _process(delta: float) -> void:
	$Label.text = str(dropped_stickies)
