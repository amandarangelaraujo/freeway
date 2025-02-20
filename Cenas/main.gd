extends Node

var cena_carros = preload("res://Cenas/carros.tscn")
var pistas_rapidas_y = [104, 272, 488]
var pistas_lentas_y = [160, 216, 324, 384, 438, 544, 600]
var score = 0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$HUD/Placar.text = str(score)
	$HUD/Mensagem.text = ""
	$HUD/Button.hide()
	$AudioTema.play()
	randomize()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_carros_rapidos_timeout() -> void:
	var carro = cena_carros.instantiate()  #instanciando aquii
	add_child(carro) #adicionando como filho da cena main
	var pista_y = pistas_rapidas_y[randi_range(0, pistas_rapidas_y.size()-1)]
	carro.position = Vector2(-10, pista_y)
	carro.set_linear_velocity(Vector2(randf_range(700, 720), 0))  #o que essa linha faz?
	carro.set_linear_damp(0.0)
	
	


func _on_timer_carros_lentos_timeout() -> void:
	var carro = cena_carros.instantiate()  #instanciando aquii
	add_child(carro) #adicionando como filho da cena main
	var pista_y = pistas_lentas_y[randi_range(0, pistas_lentas_y.size()-1)]
	carro.position = Vector2(-10, pista_y)
	carro.set_linear_velocity(Vector2(randf_range(300, 320), 0))  #o que essa linha faz?
	carro.set_linear_damp(0.0)



func _on_player_pontua() -> void:
	if score <= 10:
		score+=1
		$HUD/Placar.text = str(score)
		$AudioPonto.play()
	if score == 10:
		$HUD/Mensagem.text = "Parabéns, você é um galinha rápida!"
		$HUD/Button.show()
		$TimerCarrosRapidos.stop()
		$TimerCarrosLentos.stop()
		$AudioTema.stop()
		$AudioVitoria.play()
		$Player.speed = 0
		$Player.position = $Player.posicao_inicial
		
		
func _on_hud_reinicia() -> void:
	score = 0
	$HUD/Mensagem.text = ""
	$HUD/Button.hide()
	$TimerCarrosRapidos.start()
	$TimerCarrosLentos.start()
	$AudioTema.play()
	$AudioVitoria.stop()
	$Player.speed = 8 #Minha galinha fica lenda depois!!
	
	
