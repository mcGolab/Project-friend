extends Node2D

var zpunkty = 0
var cpunkty = 0 

func _ready():
	$"Zielonywin".hide()
	$czeronywin.hide()

func _physics_process(delta):
	if zpunkty > 2:
		$Gracz1.set_process(false)
		$Gracz1.set_process_input(false)
		
		$Gracz2.set_process(false)
		$Gracz2.set_process_input(false)
		$Zielonywin.show()
	if cpunkty > 2:
		$Gracz2.set_process(false)
		$Gracz2.set_process_input(false)
		
		$Gracz1.set_process(false)
		$Gracz1.set_process_input(false)
		$czeronywin.show()
