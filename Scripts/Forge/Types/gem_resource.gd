extends Resource
class_name CustomGemResource

@export var gem_name: String = ""
@export var shards: Array[ShardResource] = []

func add_shard(shard: ShardResource) -> void:
    shards.append(shard)

func calculate_effect() -> String:
    return gem_name
