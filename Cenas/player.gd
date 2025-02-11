extends Area2D
@export var speed: float = 100.0
var screen_size: Vector2
var posicao_inicial: Vector2 = Vector2(640, 690)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_size = get_viewport_rect().size
	position = posicao_inicial
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var velocity= Vector2.ZERO
	
	if Input.is_action_pressed("ui_up"): 		#quero que a minha galinha se desloque para cima
		velocity.y -= 1
	if Input.is_action_pressed("ui_down"):
		velocity.x += 1
	
	if velocity != Vector2.ZERO:
		velocity = velocity.normalized() * speed
	position += velocity * delta
	position.y = clamp(position.y, 0.0, screen_size.y)
	
	if velocity.y > 0:
		$animacao.play("bixo")
	elif velocity.y < 0:
		$animacao.play("cima")
	else:
		$animacao.stop()
	
	
