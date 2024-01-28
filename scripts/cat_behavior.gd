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

func _ready():
	target = get_parent().get_node("Block")

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
	apply_impulse(directionToTarget.normalized() * 5)
	current_state = CurrentState.STAY

func stay():
	"""Makes the cat stand up."""
	var stopped = get_linear_velocity().length() < .001

	if stopped:
		current_state = CurrentState.GETTING_UP

func get_up():
	global_rotation = Vector3(0, 0, 0)
	var stopped = get_linear_velocity().length() < .001

	if stopped:
		current_state = CurrentState.PLAY
