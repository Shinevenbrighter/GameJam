extends CanvasLayer

func _on_texture_button_pressed() -> void:
	# 1. Pausamos Dialogic por si Cami estaba hablando
	Dialogic.paused = true
	
	# 2. Abrimos el mapa (Cambia la ruta por la carpeta real de tu amiga si es distinta)
	get_tree().change_scene_to_file("res://Escenas/Mapa/mapa.tscn")
