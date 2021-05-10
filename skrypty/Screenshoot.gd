extends Node

func _init():
	var dir = Directory.new()
	
	dir.open("res://")
	
	if !dir.dir_exists("screenshoot"):
		dir.make_dir("screenshoot")
		
func _process(delta):
	if Input.is_action_just_pressed("ss"):
		var ss = get_viewport().get_texture().get_data()
		
		ss.flip_y()
		
		ss.save_png("res://screenshoot/screenshoot " + str(OS.get_unix_time()) + ".png")
