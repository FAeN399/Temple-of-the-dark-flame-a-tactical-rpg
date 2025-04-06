extends Control

# Simple UI for testing forge system
@onready var status_label = $StatusLabel
@onready var forge_scene = $ForgeContainer/DarkForge

func _ready() -> void:
    # Test resource loading
    var test_results = []
    
    # Try loading all required scripts
    test_results.append(_test_load_script("res://Scripts/Items/shard_resource.gd"))
    test_results.append(_test_load_script("res://Scripts/Items/gem_resource.gd"))
    test_results.append(_test_load_script("res://Scripts/Items/fused_gem_resource.gd"))
    
    # Try loading test resources
    test_results.append(_test_load_resource("res://Resources/Shards/test_fire_shard.tres"))
    
    # Update status display
    var status = "Test Results:\n"
    for result in test_results:
        status += result + "\n"
    status_label.text = status

func _test_load_script(path: String) -> String:
    var script = load(path)
    if script:
        return "✓ Loaded: " + path
    return "✗ Failed to load: " + path
    
func _test_load_resource(path: String) -> String:
    var resource = load(path)
    if resource:
        return "✓ Loaded: " + path
    return "✗ Failed to load: " + path
