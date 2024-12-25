extends SpineSprite

var animation_state
var ske

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var spineboy = $"."
	print("___", spineboy)
	
	animation_state = spineboy.get_animation_state()
	animation_state.set_animation("jump", false, 0)
	animation_state.add_animation("walk", 0, true, 0)
	animation_state.add_animation("run", 2, true, 0)
	
	ske = get_skeleton()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_left"):
		animation_state.set_animation("run", true, 0)
		ske.set_scale_x(-1)
		
	if Input.is_action_just_released("ui_left"):
		animation_state.set_animation("idle", true, 0)
		
	if (Input.is_action_just_pressed("ui_right")):
		animation_state.set_animation("run", true, 0)
		ske.set_scale_x(1)
		
	if Input.is_action_just_released("ui_right"):
		animation_state.set_animation("idle", true, 0)
