extends MarginContainer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_play_pressed():
	SceneManager.switch_target_scene("res://scenes/menus/combat_menu.tscn",
	get_parent())


func _on_settings_pressed():
	SceneManager.switch_target_scene("res://scenes/menus/settings_menu.tscn",
	get_parent())


func _on_quit_pressed():
	get_tree().quit()
