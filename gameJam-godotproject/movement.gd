class_name Player extends CharacterBody2D

const SPEED = 300.0
const JUMP_VELOCITY = -400.0
@export var speed = 200

# Nuestro candado
var puede_moverse: bool = true

func _ready() -> void:
	# Conectamos las señales de Dialogic para congelar/descongelar a Cami
	Dialogic.timeline_started.connect(_congelar_jugador)
	Dialogic.timeline_ended.connect(_descongelar_jugador)

func _congelar_jugador() -> void:
	print("Dialogic avisó: Cami CONGELADA")
	puede_moverse = false

func _descongelar_jugador() -> void:
	print("Dialogic avisó: Cami DESCONGELADA")
	puede_moverse = true

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed

func _physics_process(delta: float) -> void:
	# Si Cami está hablando, la frenamos en seco y cancelamos todo el movimiento
	if not puede_moverse:
		velocity = Vector2.ZERO
		return

	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	get_input()
	move_and_slide()
