extends Node2D

func _ready() -> void:
	# 1. Iniciamos tu novela visual apenas arranca el juego
	Dialogic.start("conversacion1") # Cambia esto por el nombre real de tu diálogo inicial
	
	# 2. Le decimos a Godot que esté atento a las señales secretas que mande Dialogic
	Dialogic.signal_event.connect(_on_dialogic_signal)

# 3. Esta función se activa cuando Dialogic manda una señal
func _on_dialogic_signal(argumento: String) -> void:
	if argumento == "activar_boton_mochila":
		# Hacemos que la mochila aparezca mágicamente en la pantalla
		$HUD_Mochila.show()
