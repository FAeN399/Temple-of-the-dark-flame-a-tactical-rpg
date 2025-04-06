extends Control

# Rooms in the temple
enum Room {
    FORGE,
    INVENTORY,
    ALTAR,
    LIBRARY
}

var current_room = Room.FORGE

func _ready():
    setup_room(current_room)

func setup_room(room: Room):
    match room:
        Room.FORGE:
            var forge_scene = preload("res://Scenes/Forge/DarkForge.tscn")
            var forge = forge_scene.instantiate()
            $ForgeRoom.add_child(forge)
