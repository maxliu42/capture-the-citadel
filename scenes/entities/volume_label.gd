extends Label

@export
var bus_name: String

var bus_index: int

func _ready() -> void:
	var default_text = self.text
	bus_index = AudioServer.get_bus_index(bus_name)
	_update_text(default_text)
	
	AudioServer.property_list_changed.connect(_update_text.bind(default_text))
	
func _update_text(default_text) -> void:
	var volume = snapped(db_to_linear(AudioServer.get_bus_volume_db(bus_index)) * 100, 2)
	self.text = default_text + str(volume)
