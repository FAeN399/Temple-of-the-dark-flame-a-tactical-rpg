extends Resource
class_name GemResource

@export var shards: Array[ShardResource] = []
@export var gem_name: String = ""
@export var power_level: int = 0
@export var icon: Texture2D

func _init() -> void:
    shards = []

func add_shard(shard: ShardResource) -> void:
    shards.append(shard)
    recalculate_power()

func recalculate_power() -> void:
    power_level = 0
    for shard in shards:
        power_level += shard.power_level

func calculate_effect() -> String:
    # Override in subclasses or extend for specific gem types
    return "Power Level: %d" % power_level
