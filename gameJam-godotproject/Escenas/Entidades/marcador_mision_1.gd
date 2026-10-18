extends Node2D

@onready var sprite = $SpriteMarcador

func _ready() -> void:
	sprite.visible = true
	EventController.interaction.connect(_on_interaction)

func _on_interaction(node: Node):
	# Cuando el jugador aprieta E sobre este objeto:
	if node == self:
		sprite.visible = false
		$AudioStreamPlayer2D.play()
		# Llamamos a tu Diálogo 3 de la misión
		Dialogic.start("03_mision_1") 
		EventController.misionIniciada.emit(1)
		EventController.interactable.emit(null, '')
