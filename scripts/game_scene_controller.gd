extends Node3D

var catScene = preload("res://scenes/cat.tscn")
var herdCount = 0
var catCount = 20

func _ready():
	for i in range(catCount):
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
	if(obj.name.begins_with("@RigidBody3D@")):
		herdCount += 1
		$"Ui-overlay/BoxContainer/HerdContainer/CatsHerdedCount".text = str(herdCount) + "/" + str(catCount)
		

func exited_goal(obj):
	if(obj.name.begins_with("@RigidBody3D@")):
		herdCount -= herdCount - 1
