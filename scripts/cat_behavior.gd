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
	PLAY
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
	var stopped = get_linear_velocity().length() < .0001
	if stopped:
		print('stopped')
		global_rotation = Vector3(0, 0, 0)

	if current_state == CurrentState.PLAY:
		play()
	elif current_state == CurrentState.STAY:
		stay()

func play():
	var directionToTarget = target.global_position - global_position
	print("directionToTarget: " + str(directionToTarget))
	apply_impulse(directionToTarget * 3)
	current_state = CurrentState.STAY

func stay():
	"""Makes the cat stand up."""
	print("standing up")
