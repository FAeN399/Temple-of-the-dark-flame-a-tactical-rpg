extends GemResource
class_name FusedGemResource

@export var source_gems: Array[GemResource] = []
@export var fusion_type: String = ""
@export_multiline var fusion_effect: String = ""

func _init() -> void:
    super._init()
    source_gems = []

func fuse_gems(gems: Array[GemResource]) -> void:
    source_gems = gems
    # Collect all shards from source gems
    for gem in gems:
        for shard in gem.shards:
            add_shard(shard)
    
    determine_fusion_effect()

func determine_fusion_effect() -> void:
    # Example fusion effect calculation
    var elements = {}
    for shard in shards:
        if not elements.has(shard.element):
            elements[shard.element] = 0
        elements[shard.element] += shard.power_level
    
    # Find dominant element
    var max_power = 0
    var dominant_element = ""
    for element in elements:
        if elements[element] > max_power:
            max_power = elements[element]
            dominant_element = element
    
    fusion_type = dominant_element
    fusion_effect = "A level %d fusion gem of %s" % [power_level, fusion_type]

func calculate_effect() -> String:
    return fusion_effect if fusion_effect else super.calculate_effect()
