extends Control

enum Room {FORGE, INVENTORY, ALTAR, LIBRARY}

var current_room = Room.FORGE
@onready var room_container = $RoomContainer
@onready var transition_overlay = $TransitionOverlay

func _ready():
    # Force fullscreen at startup
    get_window().mode = Window.MODE_FULLSCREEN
    # Ensure proper sizing
    custom_minimum_size = get_viewport_rect().size

    # Set up initial room
    setup_room(current_room)

    # Make sure we're truly fullscreen
    DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)

func _input(event: InputEvent) -> void:
    if OS.is_debug_build():
        if event.is_action_pressed("ui_right"):
            var next_room = (current_room + 1) % Room.size()
            setup_room(next_room)
        elif event.is_action_pressed("ui_left"):
            var prev_room = (current_room - 1 + Room.size()) % Room.size()
            setup_room(prev_room)

func setup_room(room: Room):
    # Store current room for transition
    var current = room_container.get_child(0) if room_container.get_child_count() > 0 else null

    # Load new room
    var scene_path = get_room_scene_path(room)
    var room_scene = load(scene_path)
    if room_scene:
        var new_room = room_scene.instantiate()
        room_container.add_child(new_room)

        # Fade transition if we had a previous room
        if current:
            transition_between_rooms(current, new_room)

        current_room = room

func transition_between_rooms(old_room: Node, _new_room: Node) -> void:
    transition_overlay.visible = true
    transition_overlay.modulate.a = 0

    # Fade out
    var tween = create_tween()
    tween.tween_property(transition_overlay, "modulate:a", 1.0, 0.3)
    await tween.finished # Changed from tween.finished() to tween.finished

    old_room.queue_free()

    # Fade in
    tween = create_tween()
    tween.tween_property(transition_overlay, "modulate:a", 0.0, 0.3)
    await tween.finished # Changed from tween.finished() to tween.finished
    transition_overlay.visible = false

func get_room_scene_path(room: Room) -> String:
    match room:
        Room.FORGE: return "res://Scenes/Forge/DarkForge.tscn"
        Room.INVENTORY: return "res://Scenes/Temple/Inventory.tscn"
        Room.ALTAR: return "res://Scenes/Temple/Altar.tscn"
        Room.LIBRARY: return "res://Scenes/Temple/Library.tscn"
        _: return ""
