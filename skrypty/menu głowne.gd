extends Node2D


func _ready():
	OS.set_window_maximized(true)

func _on_opcje_pressed():
	$window/opc.rect_position = Vector2(300, 70)


func _on_graj_pressed():
	$window/start.rect_position = Vector2(300, 70)


func _on_exit_pressed():
	get_tree().quit()


func _on_czogi_pressed():
	get_tree().change_scene("res://sceny/Czołgi.tscn")
