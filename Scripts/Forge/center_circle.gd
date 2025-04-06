extends Node2D

@export var inner_radius := 40.0
@export var outer_radius := 50.0
@export var glow_color := Color(0, 0.7, 1.0, 0.3)
@export var border_color := Color(0, 0.7, 1.0, 1.0)

func _draw():
    # Draw inner merkaba (two triangles)
    var points1 = []
    var points2 = []
    for i in range(3):
        var angle = deg_to_rad(120.0 * i)
        points1.append(Vector2(cos(angle), sin(angle)) * inner_radius)
        points2.append(Vector2(cos(angle + PI / 3), sin(angle + PI / 3)) * inner_radius)

    # Draw glow
    draw_circle(Vector2.ZERO, outer_radius, glow_color)

    # Draw triangles
    draw_colored_polygon(PackedVector2Array(points1), border_color)
    draw_colored_polygon(PackedVector2Array(points2), border_color)
