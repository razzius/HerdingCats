extends Node

var current_scene = null

func _ready():
	var root = get_tree().root
	current_scene = get_tree().get_root().get_child(root.get_child_count() - 1)

func _change_scene(scenePath):
	call_deferred("_deferred_change_scene", scenePath)

func _deferred_change_scene(scenePath):
	current_scene.free()
	var scene = ResourceLoader.load(scenePath)
	current_scene = scene.instantiate()
	get_tree().get_root().add_child(current_scene)
	get_tree().set_current_scene(current_scene)
