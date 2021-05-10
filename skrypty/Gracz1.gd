extends KinematicBody2D

export var speed = 0
var vel = Vector2()
export var rotation_speed = 0
var rotation_dir = 0

onready var Przeladowanie = $przeladowanie

export (PackedScene) var Nabuj

func _ready():
	$Particles2D.hide()
	

func _process(delta):
	vel = Vector2()
	rotation_dir = 0
	if Input.is_action_pressed("gora"):
		vel = Vector2(speed, 0).rotated(rotation)
	if Input.is_action_pressed("dol"):
		vel = Vector2(-speed, 0).rotated(rotation)
	if Input.is_action_pressed("lewo"):
		rotation_dir -= 2
	if Input.is_action_pressed("prawo"):
		rotation_dir += 2
	if Input.is_action_just_pressed("strzal"):
		$Particles2D.show()
		shoot()
	vel = move_and_slide(vel)
	rotation += rotation_dir * rotation_speed * delta
	
func shoot():
	if Przeladowanie.is_stopped():
		var n = Nabuj.instance()
		n.transform = $lufa.global_transform
		owner.add_child(n)
		Przeladowanie.start()

func _on_Area2D_area_entered(area):
	if area.is_in_group("nabuj"):
		get_parent().cpunkty += 1 
		$".".position = Vector2(185.069, 381.926)
		$".".rotation_degrees = -90
		$"../Gracz2".position = Vector2(971.453, 393.171)
		$"../Gracz2".rotation_degrees = -90


func _on_Timer2_timeout():
	$Particles2D.hide()
