extends Node

var meowEffect = load("res://audio/sfx/meow3.mp3")
var meowPlayerPool = []

func _ready():
	for i in range(20):
		var player = AudioStreamPlayer3D.new()
		player.stream = meowEffect
		add_child(player)
		meowPlayerPool.push_back(player)

func _meow():
	if meowPlayerPool.size() > 0:
		var player = meowPlayerPool.pop_front()
		player.play()
		player.finished.connect(_on_meow_finished.bind(player))

func _on_meow_finished(player):
	player.finished.disconnect(_on_meow_finished)
	meowPlayerPool.push_back(player)

