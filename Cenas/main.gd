extends Node

var cena_carros = preload("res://Cenas/carros.tscn")
var pistas_rapidas_y = [104, 272, 488]
var pistas_lentas_y = [160, 216, 324, 384, 438, 544, 600]
var score = 0

#var sobre o timer do jogo
var time_left: int = 136



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$HUD/Placar.text = str(score)
	$HUD/Mensagem.text = ""
	$HUD/Button.hide()
	$Audio2.play()
	$Timer.start()
	$HUD/TimerLabel.text = str(time_left)
	randomize()
	score=0
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_carros_rapidos_timeout() -> void:
	var carro = cena_carros.instantiate()  #instanciando aquii
	add_child(carro) #adicionando como filho da cena main
	var pista_y = pistas_rapidas_y[randi_range(0, pistas_rapidas_y.size()-1)]
	var screen_width = get_tree().root.get_viewport().get_visible_rect().size.x
	carro.position = Vector2(screen_width + 10, pista_y)
	#carro.position = Vector2(10, pista_y)
	carro.set_linear_velocity(Vector2(randf_range(-700, -720), 0))  #o que essa linha faz?
	carro.set_linear_damp(0.0)
	
	


func _on_timer_carros_lentos_timeout() -> void:
	var carro = cena_carros.instantiate()  #instanciando aquii
	add_child(carro) #adicionando como filho da cena main
	var pista_y = pistas_lentas_y[randi_range(0, pistas_lentas_y.size()-1)]
	carro.position = Vector2(-10, pista_y)
	carro.set_linear_velocity(Vector2(randf_range(300, 320), 0))  #o que essa linha faz?
	carro.set_linear_damp(0.0)



func _on_player_pontua() -> void:
	$Player.position = $Player.posicao_inicial
	$Player2.position = $Player2.posicao_inicial
	if score <= 10:
		score+=1
		$HUD/Placar.text = str(score)
		$AudioPonto.play()
	if score == 10:
		$HUD/Mensagem.text = "Parabéns, você é um galinha rápida!"
		$HUD/Button.show()
		score=0
		$TimerCarrosRapidos.stop()
		$TimerCarrosLentos.stop()
		$Audio2.stop()
		$AudioVitoria.play()
		$Player.speed = 0
		$Player.position = $Player.posicao_inicial
		$Player2.position = $Player2.posicao_inicial
		
func _on_hud_reinicia() -> void:
	score = 0
	$HUD/Mensagem.text = ""
	$HUD/Button.hide()
	$TimerCarrosRapidos.start()
	$TimerCarrosLentos.start()
	$Audio2.play()
	time_left = 136
	$AudioVitoria.stop()
	$Player.speed = 100000
	$Timer.start()
	
	
	


func _on_timer_timeout() -> void:
	time_left -= 1
	$HUD/TimerLabel.text = str(time_left)
	if time_left == 0:
		$Timer.stop()
		score = 0
		$HUD/Mensagem.text = "Que galinha lenta você é!"
		$HUD/Button.show()
		$TimerCarrosRapidos.stop()
		$TimerCarrosLentos.stop()
		$Audio2.stop()
		$AudioVitoria.play()
		$Player.speed = 0
		$Player.position = $Player.posicao_inicial
	
		
		


func _on_pontua() -> void:
	pass # Replace with function body.
