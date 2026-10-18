extends Node2D

@onready var sprite = $SpriteMarcador

func _ready() -> void:
	sprite.visible = true
	EventController.interaction.connect(_on_interaction)


func _on_interaction(node: Node):
	if node == self:
		sprite.visible = false
	#Dialogic.start("conversacion1")
		EventController.interactable.emit(null, '')
	
