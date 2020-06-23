extends Node

func _ready():
	$MarginContainer/VBoxContainer/VBoxContainer2/TextureButton.grab_focus()
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)




# warning-ignore:unused_argument
func _physics_process(delta):
	if $MarginContainer/VBoxContainer/VBoxContainer2/TextureButton.is_hovered() == true:
		$MarginContainer/VBoxContainer/VBoxContainer2/TextureButton.grab_focus()
	if $MarginContainer/VBoxContainer/VBoxContainer2/TextureButton2.is_hovered() == true:
		$MarginContainer/VBoxContainer/VBoxContainer2/TextureButton2.grab_focus()


func _on_TextureButton_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scenes./Stage1.tscn")


func _on_TextureButton2_pressed():
	get_tree().quit()
