extends Node3D

var catScene = preload("res://scenes/cat.tscn")

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
