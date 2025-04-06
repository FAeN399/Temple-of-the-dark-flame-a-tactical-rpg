extends Area2D
class_name HexForgeSlot # Renamed from HexPanel

enum SlotState {EMPTY, FILLED, HOVER, DROP_TARGET}

@onready var border = $Border

# Signals to notify the parent Forge UI about changes
signal gem_placed(gem: GemResource) # Emitted when a gem is dropped
signal gem_cleared() # Emitted when the gem is removed

@export var hex_radius: float = 60.0

var label_node: Label
var current_gem: GemResource = null
var state = SlotState.EMPTY

# State flags for visual feedback
var is_hovering: bool = false
var can_accept_drop_visual: bool = false

func _ready() -> void:
	set_process_input(true)

	label_node = Label.new()
	label_node.name = "HexLabel"
	label_node.position = Vector2(-hex_radius, -hex_radius)
	label_node.size = Vector2(hex_radius * 2, hex_radius * 2)
	label_node.text = ""
	label_node.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
	label_node.vertical_alignment = VERTICAL_ALIGNMENT_CENTER
	label_node.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	add_child(label_node)

	mouse_entered.connect(_on_mouse_enter)
	mouse_exited.connect(_on_mouse_exited)
	input_event.connect(_on_input_event)

	update_display()
	update_visuals()

func set_gem(new_gem: GemResource) -> void:
	# Check if the gem actually changed
	if current_gem == new_gem:
		return
	current_gem = new_gem
	update_display() # Refresh visuals and label
	if current_gem != null:
		emit_signal("gem_placed", current_gem)
	else:
		emit_signal("gem_cleared")

func clear_gem() -> void:
	set_gem(null)

func update_display() -> void:
	if current_gem:
		var display_text = "GEM"
		if current_gem.has_method("calculate_effect"):
			display_text = current_gem.calculate_effect()
		elif current_gem.shards.size() > 0 and current_gem.shards[0] is ShardResource:
			display_text = current_gem.shards[0].shard_type.capitalize()
		label_node.text = display_text
	else:
		label_node.text = ""
	queue_redraw()

func update_visuals():
	match state:
		SlotState.EMPTY:
			border.color = Color(0, 0.7, 1, 1) # Cyan
		SlotState.FILLED:
			border.color = Color(1, 0.7, 0, 1) # Gold
		SlotState.HOVER:
			border.color = Color(1, 1, 1, 1) # White
		SlotState.DROP_TARGET:
			border.color = Color(0, 1, 0, 1) # Green

func _draw() -> void:
	var border_color = Color(0.1, 1.0, 1.0, 1.0)
	var fill_color = Color(0.2, 0.2, 0.2, 0.3)
	var glow_color = Color(0.0, 1.0, 1.0, 0.3)
	var border_width = 2.0
	var glow_width = 8.0

	if current_gem != null:
		border_color = Color(1.0, 0.8, 0.2, 1.0)
		glow_color = Color(1.0, 0.8, 0.2, 0.3)
		fill_color = Color(0.4, 0.3, 0.1, 0.4)
	elif can_accept_drop_visual:
		border_color = Color(0.2, 1.0, 0.2, 1.0)
		glow_color = Color(0.2, 1.0, 0.2, 0.3)
		fill_color = Color(0.1, 0.4, 0.1, 0.4)
	elif is_hovering:
		border_color = Color(1.0, 1.0, 1.0, 1.0)
		fill_color = Color(0.4, 0.4, 0.4, 0.4)

	var points = get_hex_points(hex_radius)
	var centered_points = PackedVector2Array()
	for p in points:
		centered_points.append(p)

	draw_colored_polygon(centered_points, fill_color)
	var closed_points = centered_points + [centered_points[0]]
	draw_polyline(closed_points, border_color, border_width, true)
	draw_polyline(closed_points, glow_color, glow_width, true)

func get_hex_points(r: float) -> PackedVector2Array:
	var center = Vector2(r, r)
	var pts = PackedVector2Array()
	for i in range(6):
		var angle = deg_to_rad(60.0 * i - 30.0)
		var x = center.x + r * cos(angle)
		var y = center.y + r * sin(angle)
		pts.append(Vector2(x, y))
	return pts
func _can_drop_data(_at_position: Vector2, data) -> bool:
	var can_drop_now = (data is GemResource)
	if can_accept_drop_visual != can_drop_now:
		can_accept_drop_visual = can_drop_now
		queue_redraw()
	return can_drop_now
func _drop_data(_at_position: Vector2, data) -> void:
	if data is GemResource:
		set_gem(data)
	if can_accept_drop_visual:
		can_accept_drop_visual = false
		queue_redraw()
func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.pressed:
		if event.button_index == MOUSE_BUTTON_LEFT:
			if current_gem:
				print("Left-clicked slot containing: ", current_gem)
			else:
				print("Left-clicked empty slot.")
		elif event.button_index == MOUSE_BUTTON_RIGHT:
			if current_gem != null:
				get_viewport().set_input_as_handled()
				clear_gem()

func _on_mouse_enter() -> void:
	is_hovering = true
	if state == SlotState.EMPTY:
		state = SlotState.HOVER
	update_visuals()
	queue_redraw()

func _on_mouse_exited() -> void:
	is_hovering = false
	if can_accept_drop_visual:
		can_accept_drop_visual = false
	if state == SlotState.HOVER:
		state = SlotState.EMPTY
	update_visuals()
	queue_redraw()

func _on_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_RIGHT:
		if event.pressed and current_gem:
			clear_gem()
