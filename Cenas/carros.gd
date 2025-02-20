extends RigidBody2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var tipo_carros = $Animacao.sprite_frames.get_animation_names()
	var carro = tipo_carros[randi_range(0, tipo_carros.size()-1 )]
	$Animacao.animation = carro  #não entendi essa linha


func _on_notificador_screen_exited() -> void:
	queue_free()


#tentar aqui
func _on_body_entered(body: Node) -> void:
	print("Galinha atropelada")
	
	

	
