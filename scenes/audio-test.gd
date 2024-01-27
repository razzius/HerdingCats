extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _meow():
	$meow.play()
	pass

func _music_play():
	$music.play()
	pass
	
func _music_stop():
	$music.stop()
	pass
