extends Control

enum Room {FORGE, INVENTORY, ALTAR, LIBRARY}

var current_room = Room.FORGE
@onready var room_container = $RoomContainer
@onready var transition_overlay = $TransitionOverlay

func _ready():
    # Set up initial room
    setup_room(current_room)

    # Make sure we're truly fullscreen
    DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)

func setup_room(room: Room):
    # Clear existing room
    for child in room_container.get_children():
        child.queue_free()

    # Load and setup new room
    var scene_path = get_room_scene_path(room)
    var room_scene = load(scene_path)
    if room_scene:
        var room_instance = room_scene.instantiate()
        room_container.add_child(room_instance)

func get_room_scene_path(room: Room) -> String:
    match room:
        Room.FORGE: return "res://Scenes/Forge/DarkForge.tscn"
        Room.INVENTORY: return "res://Scenes/Temple/Inventory.tscn"
        Room.ALTAR: return "res://Scenes/Temple/Altar.tscn"
        Room.LIBRARY: return "res://Scenes/Temple/Library.tscn"
        _: return ""
