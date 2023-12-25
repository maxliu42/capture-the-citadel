extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	pass


func load_to_target_scene(res_path, target):
	var default = load(res_path)
	var default_scene = default.instantiate()
	target.add_child(default_scene)


func clear_from_target_scene(target):
	for n in target.get_children():
		target.remove_child(n)
		n.queue_free()


func switch_target_scene(res_path, target):
	call_deferred("_deferred_switch_target_scene", res_path, target)


func _deferred_switch_target_scene(res_path, target):

	# remove all children
	clear_from_target_scene(target)
		
	# add the desired
	var new_node = load(res_path).instantiate()
	target.add_child(new_node)
