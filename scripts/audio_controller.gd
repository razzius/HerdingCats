extends Node

var victorySound = load("res://audio/sfx/victory.mp3")
var meowEffect = load("res://audio/sfx/meow3.mp3")
var meowPlayerPool = []
var victoryPlayer = null

func _ready():
	for i in range(20):
		var player = AudioStreamPlayer3D.new()
		player.stream = meowEffect
		add_child(player)
		meowPlayerPool.push_back(player)
	victoryPlayer = AudioStreamPlayer3D.new()
	victoryPlayer.stream = victorySound
	add_child(victoryPlayer)

func _meow():
	if meowPlayerPool.size() > 0:
		var player = meowPlayerPool.pop_front()
		player.play()
		player.finished.connect(_on_meow_finished.bind(player))

func _on_meow_finished(player):
	player.finished.disconnect(_on_meow_finished)
	meowPlayerPool.push_back(player)
	
func _victory():
	victoryPlayer.play()


