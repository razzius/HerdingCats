extends Node3D

var mainMenuScenePath = "res://scenes/main_menu.tscn"
var catScene = preload("res://scenes/Cat/cat.tscn")
var herdCount = 0
var catCount = 10
var mutex = Mutex.new()

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

func _process(_delta):
	if Input.is_action_pressed("ui_cancel"):
		GameManager._change_scene(mainMenuScenePath)

func _physics_process(delta):
	var bodies = $Node3D/CollisionArea3D.get_overlapping_bodies()
	var count = 0
	var targets = []
	for b in bodies:
		if(b.name.begins_with("@RigidBody3D@") || b.name.begins_with("Cat")):
			count+=1
			targets.append(b)
	$"Ui-overlay/BoxContainer/HerdContainer/CatsHerdedCount".text = str(count) + "/" + str(catCount)	
	
	if(count == catCount):
		AudioController._victory()
		print("entire herd collected!")
		
		

	
	#if(obj.name.begins_with("@RigidBody3D@")):
		#mutex.lock()
		#herdCount += 1
		#print("entered - herd count: " + str(herdCount) + obj.name)
		#$"Ui-overlay/BoxContainer/HerdContainer/CatsHerdedCount".text = str(herdCount) + "/" + str(catCount)
		#mutex.unlock()
		

#func exited_goal(obj):
	#if(obj.name.begins_with("@RigidBody3D@")):
		#mutex.lock()
		#herdCount -= 1
		#print("entered - herd count: " + str(herdCount) + obj.name)
		#$"Ui-overlay/BoxContainer/HerdContainer/CatsHerdedCount".text = str(herdCount) + "/" + str(catCount)
		#mutex.unlock()
