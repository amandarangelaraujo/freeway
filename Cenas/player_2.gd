extends Area2D
@export var speed: float = 250.0
var screen_size: Vector2
var posicao_inicial: Vector2 = Vector2(340, 690)
signal pontua

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size
	position = posicao_inicial
	

func _process(delta: float) -> void:
	var velocity= Vector2.ZERO
	
	if Input.is_action_pressed("move_up"): 		#quero que a minha galinha se desloque para cima
		velocity.y -= 10
	if Input.is_action_pressed("move_down"):  #Galinha deveria ir para baixo
		velocity.y += 10
	
	if Input.is_action_pressed("move_left"):
		velocity.x -= 2
	if Input.is_action_pressed("move_right"):
		velocity.x += 2
	
	if velocity != Vector2.ZERO:
		velocity = velocity.normalized() * speed
	position += velocity * delta
	#não deixar a galinha sair da tela
	position.y = clamp(position.y, 0.0, screen_size.y)
	position.x = clamp(position.x, 0.0, screen_size.x)
	
	if velocity.y > 0:
		$Animacao.play("baixo")
	elif velocity.y < 0:
		$Animacao.play("cima")
	elif velocity.x > 0:
		$Animacao.play("cima")
	elif velocity.x < 0:
		$Animacao.play("cima")
	else:
		$Animacao.stop()
	
	


func _on_body_entered(body: Node2D) -> void:
	print("Colisão detectada")
	if body.name == "LinhaChegada":
		print("galinhaaa")
		emit_signal("pontua")
	else:
		position = posicao_inicial
		$Audio.play()
	
		
	


#func _on_audio_tema_ready() -> void:
	


func _on_pontua() -> void:
	pass # Replace with function body.
