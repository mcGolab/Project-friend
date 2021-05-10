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
	if Input.is_action_pressed("goras"):
		vel = Vector2(speed, 0).rotated(rotation)
	if Input.is_action_pressed("dols"):
		vel = Vector2(-speed, 0).rotated(rotation)
	if Input.is_action_pressed("lewos"):
		rotation_dir -= 2
	if Input.is_action_pressed("prawos"):
		rotation_dir += 2
	if Input.is_action_just_pressed("Strzal"):
		$Particles2D.show()
		shoot()
	vel = move_and_slide(vel)
	rotation += rotation_dir * rotation_speed * delta
	
func _on_Area2D_area_entered(area):
	if area.is_in_group("nabuj"):
		get_parent().zpunkty += 1
		$"../Gracz1".position = Vector2(100.974, 332.537)
		$"../Gracz1".rotation_degrees = -90
		$".".position = Vector2(971.453, 393.171)
		$".".rotation_degrees = -90

func shoot():
	if Przeladowanie.is_stopped():
		var n = Nabuj.instance()
		n.transform = $lufa.global_transform
		owner.add_child(n)
		Przeladowanie.start()


func _on_Timer2_timeout():
	$Particles2D.hide()
