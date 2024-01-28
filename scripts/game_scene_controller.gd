extends Node3D

var catScene = preload("res://scenes/cat.tscn")
var herdCount = 0

func _ready():
	for i in range(20):
		createCat()

func createCat():
	var randomPosition = Vector3(
		getRandomNumberForPosition(),
		getRandomNumberForPosition(),
		getRandomNumberForPosition()
	)
	var cat = catScene.instantiate()
	add_child(cat)
	(cat as Node3D).global_position = randomPosition

func getRandomNumberForPosition():
	return (.5 - randf()) * 10

func entered_goal(obj):
	print(obj.name)
	if(obj.name.begins_with("@RigidBody3D@")):
		herdCount = herdCount + 1
		print(herdCount)

func exited_goal(obj):
	if(obj.name.begins_with("@RigidBody3D@")):
		print("exited! new count:"+ str(herdCount))
		herdCount = herdCount - 1
