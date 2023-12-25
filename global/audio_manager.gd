extends Node

@export var press_stream: AudioStream
@export var hover_stream: AudioStream
@export var main_theme: AudioStream

# Called when the node enters the scene tree for the first time.
func _ready():
	link_buttons()
	play_sound(main_theme)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func play_sound(stream: AudioStream):
	var instance = AudioStreamPlayer.new()
	instance.stream = stream
	instance.finished.connect(remove_node.bind(instance))
	add_child(instance)
	instance.play()


func remove_node(instance: AudioStreamPlayer):
	instance.queue_free()


func link_buttons():
	var buttons: Array = get_tree().get_nodes_in_group("Buttons")
	for inst in buttons:
		inst.pressed.connect(on_button_pressed)


func on_button_pressed():
	play_sound(press_stream)
