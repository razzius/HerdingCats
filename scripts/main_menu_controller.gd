extends Node

@export_file var gameScenePath: String

func _on_start_button_pressed():
	GameManager._change_scene(gameScenePath)
