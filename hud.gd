extends CanvasLayer

signal reinicia


func _ready():
	pass
	
func game_over() -> void:
	# Coloque aqui o que deve acontecer quando o tempo acabar
	print("Tempo esgotado!")
	
	
func _on_button_pressed() -> void:
	emit_signal("reinicia")
