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
	if current_state == CurrentState.PLAY:
		play()

func play():
	var directionToTarget = target.global_position - global_position
	apply_impulse(directionToTarget)
	current_state = CurrentState.STAY
