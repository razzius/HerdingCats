extends Node

@export_file var gameScenePath: String

func _on_start_button_pressed():
	GameManager._change_scene(gameScenePath)

func _input(event):
	if event is InputEventMouseButton and Input.mouse_mode != Input.MOUSE_MODE_CAPTURED:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
