extends TextureButton

var offset = Vector2()

func _ready():
	set_process(false)

func _process(delta):
	rect_position = get_global_mouse_position() - offset


func _on_Tiletebar_button_down():
	set_process(true)
	offset = get_global_mouse_position() - rect_position
	get_parent().move_child(self, 2)


func _on_Tiletebar_button_up():
	set_process(false)


func _on_close_pressed():
	rect_position = Vector2(0, -600)
