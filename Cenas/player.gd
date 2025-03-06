extends Area2D
@export var speed: float = 100.0
var screen_size: Vector2
var posicao_inicial: Vector2 = Vector2(640, 690)
signal pontua

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size
	position = posicao_inicial
	

func _process(delta: float) -> void:
	var velocity= Vector2.ZERO
	
	if Input.is_action_pressed("ui_up"): 		#quero que a minha galinha se desloque para cima
		velocity.y -= 1
	if Input.is_action_pressed("ui_down"):  #Galinha deveria ir para baixo
		velocity.y += 1
	
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1
	
	if velocity != Vector2.ZERO:
		velocity = velocity.normalized() * speed
	position += velocity * delta
	#não deixar a galinha sair da tela
	position.y = clamp(position.y, 0.0, screen_size.y)
	position.x = clamp(position.x, 0.0, screen_size.x)
	
	if velocity.y > 0:
		$Animacao.play("sapo")
	elif velocity.y < 0:
		$Animacao.play("sapo")
	elif velocity.x > 0:
		$Animacao.play("sapo")
	elif velocity.x < 0:
		$Animacao.play("sapo")
	else:
		$Animacao.stop()
	
	


func _on_body_entered(body: Node2D) -> void:
	print("Colisão detectada")
	if body.name == "LinhaChegada":
		emit_signal("pontua")
	else:
		position = posicao_inicial
		$Audio.play()
		

	
		
	


#func _on_audio_tema_ready() -> void:
	
