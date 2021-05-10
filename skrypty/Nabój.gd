extends Area2D

export var speed = 0

func _physics_process(delta):
	position += transform.x * speed * delta

func _on_Nabj_body_entered(body):
	queue_free()
