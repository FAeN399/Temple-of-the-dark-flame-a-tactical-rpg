extends Resource
class_name ShardResource

@export var shard_type: String = ""
@export var power_level: int = 1
@export var element: String = ""
@export_multiline var description: String = ""

# Optional texture for inventory display
@export var icon: Texture2D

func _init(p_type: String = "", p_power: int = 1, p_element: String = "") -> void:
    shard_type = p_type
    power_level = p_power
    element = p_element

func get_display_name() -> String:
    return "%s Shard (Lvl %d)" % [shard_type, power_level]
