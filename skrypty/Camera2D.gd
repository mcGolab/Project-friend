extends Camera2D

var magnitude = 0
var timeleft = 0

func shake(new_magnitude, lifetime):
	magnitude = new_magnitude
	timeleft = lifetime
	
	while timeleft > 0:
		var vel = Vector2()
		vel.x = rand_range(-magnitude, magnitude)
		vel.y = rand_range(-magnitude, magnitude)
		set_vel(vel)
		
		timeleft -= get_process_delta_time()
		yield(get_tree(), "idle_frame")
		
	set_vel(Vector2(0, 0))
