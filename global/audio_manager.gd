extends Node

signal volume_changed

@export var press_stream: AudioStream
@export var hover_stream: AudioStream
@export var main_theme: AudioStream

# Called when the node enters the scene tree for the first time.
func _ready():
	link_buttons()
	play_sound(main_theme, "Music")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func play_sound(stream: AudioStream, bus_name: String):
	var instance = AudioStreamPlayer.new()
	instance.stream = stream
	instance.bus = bus_name
	instance.finished.connect(remove_node.bind(instance))
	add_child(instance)
	instance.play()


func remove_node(instance: AudioStreamPlayer):
	instance.queue_free()


func link_buttons():
	var buttons: Array = get_tree().get_nodes_in_group("Buttons")
	for inst in buttons:
		inst.pressed.connect(on_button_pressed)
		inst.mouse_entered.connect(on_button_hovered)


func on_button_pressed():
	play_sound(press_stream, "Effects")


func on_button_hovered():
	play_sound(hover_stream, "Effects")
