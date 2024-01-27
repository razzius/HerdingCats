extends Node3D

@export var personality: Personality
@export var current_state: CurrentState
@export var food_preference: FoodPreference

enum Personality {
	FRIENDLY,
	CRANKY,
	CURIOUS
}

enum CurrentState {
	HUNGRY,
	THIRSTY,
	LITTERBOX,
	ZOOMIES,
	NAUSEOUS,
	CATNIPPED
}

enum FoodPreference {
	DRY_FOOD,
	WET_FOOD,
	HOUSEPLANTS,
	HUMAN_FOOD
}

#func _ready():
