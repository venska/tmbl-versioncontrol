extends Control

onready var scene_tree = get_tree()
onready var pause_overlay: ColorRect = get_node("black")

var paused: = false setget set_paused

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("pause"):
		self.paused = !paused
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		scene_tree.set_input_as_handled()

func set_paused(value: bool) -> void:
	paused = value
	scene_tree.paused = value
	pause_overlay.visible = value


func _on_TextureButton3_pressed():
	self.paused = !paused
	get_tree().change_scene("res://Scenes/Titlescreen.tscn")


func _on_TextureButton_pressed():
	self.paused = !paused
