extends Control

@export var orbit_radius: float = 200.0     # Distance of hexagons from center
@export var hex_size: float = 60.0          # "Radius" for each hex
@export var rotation_speed: float = 0.5     # Radians per second for center shape rotation
@export var hex_angle_offset: float = 0.0   # Ring rotation offset

var center_rotation := 0.0
var hex_nodes := []  # Storage for our 6 hex panels
const NUM_HEX := 6

signal forge_complete(result: FusedGemResource)

# Track whether forge can be activated
var can_forge := false

func _ready() -> void:
    # Create the rotating center shape.
    create_center_circle()
    # Create 6 hex panels around the center.
    for i in range(NUM_HEX):
        var hex_slot = create_hex_slot(i)
        add_child(hex_slot)
        hex_nodes.append(hex_slot)
        # Connect signals
        hex_slot.gem_placed.connect(_on_slot_gem_placed.bind(i))
        hex_slot.gem_cleared.connect(_on_slot_gem_cleared.bind(i))
    # Initial positioning.
    position_hex_panels()
    
    # For testing: Load and place test gems
    if OS.is_debug_build():
        _setup_test_gems()

func _process(delta: float) -> void:
    # Rotate the center circle.
    center_rotation += rotation_speed * delta
    var center_child = $CenterCircle if has_node("CenterCircle") else null
    if center_child:
        center_child.rotation = center_rotation
    # Update hex panels positions.
    position_hex_panels()

func create_center_circle() -> void:
    # Create a circle shape using an EllipseShape2D as a placeholder.
    var circle = EllipseShape2D.new()
    circle.radius = Vector2(50, 50)
    var center_node = Node2D.new()
    center_node.name = "CenterCircle"
    center_node.position = rect_size / 2.0  # Center placement
    # Create a custom drawing node for the circle.
    var draw_center = CenterCircle2D.new()
    draw_center.shape = circle
    center_node.add_child(draw_center)
    add_child(center_node)

func position_hex_panels() -> void:
    # Position hex panels evenly in a circle.
    var center = rect_size / 2.0
    for i in range(NUM_HEX):
        var fraction = float(i) / float(NUM_HEX)
        var angle = fraction * TAU + hex_angle_offset
        var hx = center.x + orbit_radius * cos(angle)
        var hy = center.y + orbit_radius * sin(angle)
        var hex_panel = hex_nodes[i]
        hex_panel.position = Vector2(hx, hy)
        hex_panel.rotation = angle

func create_hex_slot(index: int) -> Control:
    # Instance hex forge slot instead of old hex panel
    var hex_slot = preload("res://Scenes/Forge/HexForgeSlot.tscn").instantiate()
    hex_slot.name = "HexSlot_%d" % index
    hex_slot.hex_radius = hex_size
    return hex_slot

func _on_slot_gem_placed(gem: GemResource, slot_index: int) -> void:
    # Check if we can forge (all slots filled)
    check_forge_status()

func _on_slot_gem_cleared(slot_index: int) -> void:
    can_forge = false
    
func check_forge_status() -> void:
    # Check if all slots have gems
    can_forge = true
    for slot in hex_nodes:
        if not slot.current_gem:
            can_forge = false
            break
    
    if can_forge:
        trigger_forging()

func trigger_forging() -> void:
    var gems = []
    for slot in hex_nodes:
        gems.append(slot.current_gem)
    
    # Create fused gem from all slots
    var fused = FusedGemResource.new()
    fused.fuse_gems(gems)
    
    # Emit signal with result
    emit_signal("forge_complete", fused)
    
    # Clear all slots
    for slot in hex_nodes:
        slot.clear_gem()

func _setup_test_gems() -> void:
    # Load test shard
    var test_shard = load("res://Resources/Shards/test_fire_shard.tres")
    if not test_shard:
        print("Failed to load test shard!")
        return
        
    # Create test gems
    for i in range(NUM_HEX):
        var test_gem = GemResource.new()
        test_gem.add_shard(test_shard)
        test_gem.gem_name = "Test Gem %d" % i
        
        # Place in slot
        if i < hex_nodes.size():
            hex_nodes[i].set_gem(test_gem)
    
    print("Test gems placed in slots")
    
func _input(event: InputEvent) -> void:
    if OS.is_debug_build() and event.is_action_pressed("ui_accept"):
        _setup_test_gems()  # Reset test state

# Note: CenterCircle2D should be defined in its own script or as an inline class.
# For testing, you might replace it with a simple Node2D that overrides _draw().
