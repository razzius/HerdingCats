extends Node3D
@onready var laserPosition = get_node("../")

# Called when the node enters the scene tree for the first time.
func _ready():
	get_node(".").visible = true
	print(get_tree())	#print(character.get_child_count())


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
