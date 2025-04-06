extends Node2D
class_name Demitree

@export var tree_height: float = 100.0
@export var tree_width: float = 50.0
@export var leaf_color: Color = Color(0.0, 1.0, 0.0)
@export var trunk_color: Color = Color(0.4, 0.2, 0.0)

func _ready() -> void:
	# Placeholder for initialization logic.
	update()

func _draw() -> void:
	# Draw the trunk.
	var trunk_top = Vector2(tree_width / 2, tree_height * 0.6)
	var trunk_bottom = Vector2(tree_width / 2, tree_height)
	draw_line(trunk_top, trunk_bottom, trunk_color, tree_width * 0.2)

	# Draw the leaves as a circle.
	var leaf_center = Vector2(tree_width / 2, tree_height * 0.3)
	draw_circle(leaf_center, tree_width / 2, leaf_color)