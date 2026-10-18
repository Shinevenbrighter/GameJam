extends Node2D # (O el nodo principal que ella esté usando para el mapa)
@onready var audio_player: AudioStreamPlayer2D = $BGMusic

func _ready() -> void:
	# 1. Quitamos la pausa que venía desde el botón de la mochila
	Dialogic.paused = false
	
	# 2. Ahora sí, arrancamos el diálogo del tutorial de Chippy
	Dialogic.start("02_tutorial_chippy")
	
	EventController.misionIniciada.connect(_mision_iniciada)
	EventController.misionTerminada.connect(_mision_terminada)
func _mision_iniciada(num : int):
	var tween = create_tween()
	tween.tween_property(audio_player, "volume_db", -88.0, 1.5)
	tween.tween_callback(func():audio_player.stream_paused = true)
	
func _mision_terminada(num : int):
	audio_player.stream_paused = false
	
	var tween = create_tween()
	tween.tween_property(audio_player, "volume_db", 0, 1.5)
