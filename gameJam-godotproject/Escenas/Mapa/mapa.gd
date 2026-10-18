extends Node2D # (O el nodo principal que ella esté usando para el mapa)

func _ready() -> void:
	# 1. Quitamos la pausa que venía desde el botón de la mochila
	Dialogic.paused = false
	
	# 2. Ahora sí, arrancamos el diálogo del tutorial de Chippy
	Dialogic.start("02_tutorial_chippy")
