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

func _ready():
	# target = get_parent().get_node("Block")
	target = get_parent().get_node("Character")
	
func _process(delta):
	var velo = get_linear_velocity().length()
	print("{} w velocity {}".format([CurrentState.keys()[current_state], velo], "{}"))
	if current_state == CurrentState.PLAY:
		play()
	elif current_state == CurrentState.STAY:
		stay()
	elif current_state == CurrentState.GETTING_UP:
		get_up()

func play():
	var directionToTarget = target.global_position - global_position
	print("directionToTarget: " + str(directionToTarget))
	var speed = rng.randf_range(-5, 10.0)
	var direction = directionToTarget.normalized() + Vector3.UP
	apply_impulse(direction * speed)
	current_state = CurrentState.STAY

func stay():
	"""Makes the cat stand up."""
	var stopped = get_linear_velocity().length() < .01

	if stopped:
		current_state = CurrentState.GETTING_UP
		global_rotation = Vector3(0, 0, 0)

func get_up():
	var stopped = get_linear_velocity().length() < .01

	if stopped:
		current_state = CurrentState.PLAY
