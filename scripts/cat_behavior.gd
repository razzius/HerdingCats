extends RigidBody3D

@export var personality: Personality
@export var current_state: CurrentState
@export var food_preference: FoodPreference

var target: Node3D

enum Personality {
	FRIENDLY,
	CRANKY,
	CURIOUS
}

enum CurrentState {
	STAY,
	HUNGRY,
	THIRSTY,
	LITTERBOX,
	ZOOMIES,
	NAUSEOUS,
	CATNIPPED,
	PLAY,
	GETTING_UP
}

enum FoodPreference {
	DRY_FOOD,
	WET_FOOD,
	HOUSEPLANTS,
	HUMAN_FOOD
}

var rng = RandomNumberGenerator.new()

@onready var laser = get_parent().get_node("Laser")
@onready var character = get_parent().get_node("Character")

const GET_UP_THRESHOLD = .1

func _ready():
	target = character
	
func _process(delta):
	if laser.visible:
		target = laser
	else:
		target = character

	var velo = get_linear_velocity().length()
	#print("{} w velocity {}".format([CurrentState.keys()[current_state], velo], "{}"))
	if current_state == CurrentState.PLAY:
		play()
	elif current_state == CurrentState.STAY:
		stay()
	elif current_state == CurrentState.GETTING_UP:
		get_up()

func play():
	current_state = CurrentState.STAY

	if not laser.visible:
		return

	var directionToTarget = target.global_position - global_position

	#print("directionToTarget: " + str(directionToTarget))
	var speed = rng.randf_range(5.0, 10.0)
	var direction = directionToTarget.normalized() + Vector3.UP / 2
	apply_impulse(direction * speed)
	AudioController._meow()

func stay():
	"""Makes the cat stand up."""
	var stopped = get_linear_velocity().length() < GET_UP_THRESHOLD

	if stopped:
		current_state = CurrentState.GETTING_UP
		global_rotation = Vector3(0, global_rotation.y, 0)

func get_up():
	var stopped = get_linear_velocity().length() < GET_UP_THRESHOLD

	if stopped:
		current_state = CurrentState.PLAY
