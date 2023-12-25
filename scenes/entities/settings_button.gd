extends TextureButton

func _on_button_down():
	position.y += 5


func _on_button_up():
	position.y -= 5
