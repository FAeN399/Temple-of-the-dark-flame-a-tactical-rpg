extends Node2D

@export var orbit_radius: float = 200.0
@export var hex_size: float = 60.0
@export var rotation_speed: float = 0.5

var center_rotation := 0.0
var hex_nodes := []
const NUM_HEX := 6

@onready var background = $Background

func _ready():
    create_center_merkaba()
    setup_hex_slots()

func _process(delta):
    center_rotation += rotation_speed * delta
    $Merkaba.rotation = center_rotation

func create_center_merkaba():
    var merkaba = Node2D.new()
    merkaba.name = "Merkaba"
    add_child(merkaba)

func setup_hex_slots():
    for i in range(NUM_HEX):
        var slot = preload("res://Scenes/Forge/HexForgeSlot.tscn").instantiate()
        var angle = (2 * PI * i) / NUM_HEX
        slot.position = Vector2(
            cos(angle) * orbit_radius,
            sin(angle) * orbit_radius
        )
        add_child(slot)

signal forge_complete(result: FusedGemResource)

var can_forge := false

func _on_slot_gem_placed(_gem: GemResource, _slot_index: int) -> void:
    check_forge_status()

func _on_slot_gem_cleared(_slot_index: int) -> void:
    can_forge = false

func check_forge_status() -> void:
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

    var fused = FusedGemResource.new()
    fused.fuse_gems(gems)

    emit_signal("forge_complete", fused)

    for slot in hex_nodes:
        slot.clear_gem()

func _setup_test_gems() -> void:
    var test_shard = load("res://Resources/Shards/test_fire_shard.tres")
    if not test_shard:
        print("Failed to load test shard!")
        return

    for i in range(NUM_HEX):
        var test_gem = GemResource.new()
        test_gem.add_shard(test_shard)
        test_gem.gem_name = "Test Gem %d" % i

        if i < hex_nodes.size():
            hex_nodes[i].set_gem(test_gem)

    print("Test gems placed in slots")

func _input(event: InputEvent) -> void:
    if OS.is_debug_build() and event.is_action_pressed("ui_accept"):
        _setup_test_gems()
