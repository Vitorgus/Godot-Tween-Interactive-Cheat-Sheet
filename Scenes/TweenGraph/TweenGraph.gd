tool
extends Control


export(Enums.Transition) var transition_type = Enums.Transition.TRANS_CUBIC
export(Enums.Ease) var ease_type = Enums.Ease.EASE_IN
export var line_color := Color( 0.4, 0.5, 1, 1 ) setget set_line_color
export var auto_start := true

onready var Line: Line2D = $HBoxContainer/GraphContainer/Line2D
onready var Img: Sprite = $HBoxContainer/ImageContainer/Sprite
onready var rect: Vector2 = $HBoxContainer/GraphContainer.rect_size

var tween_values := PoolRealArray()
var axis_size := 300
var loading := false setget set_loading
var is_mouse_hovering := false

func _ready() -> void:
	Line.clear_points()
	Line.default_color = line_color
	$HBoxContainer/ImageContainer.modulate_pointer(line_color)
	if Engine.editor_hint:
		Line.add_point(Vector2(0, rect.y))
		Line.add_point(Vector2(rect.x, 0))
	else:
		if auto_start:
			calculate()

func calculate() -> void:
	self.loading = true
	$Tween.interpolate_method(self, "append_tween_value", rect.y, 0, 1.5, transition_type, ease_type)
	$Tween.start()

func append_tween_value(x: float) -> void:
	tween_values.append(x)

func set_line_color(color: Color) -> void:
	line_color = color
	if is_instance_valid(Line):
		Line.default_color = line_color

func set_loading(val: bool) -> void:
	loading = val
	$LoadingContainer.visible = loading

func _on_Tween_tween_completed(object: Object, key: NodePath) -> void:
	if tween_values.size() != 0:
		var axis_step = rect.x / tween_values.size()
		for i in range(tween_values.size()):
			Line.add_point(Vector2(axis_step * i, tween_values[i]))
	$LoadingContainer.visible = false
	self.loading = false

func _on_GraphContainer_resized() -> void:
	if Engine.editor_hint and is_instance_valid(Line):
		rect = $HBoxContainer/GraphContainer.rect_size
		Line.clear_points()
		Line.add_point(Vector2(0, rect.y))
		Line.add_point(Vector2(rect.x, 0))
		Line.points

func _on_TweenGraph_mouse_entered() -> void:
#	Line.default_color = Line.default_color.inverted()
#	Line.default_color = line_color.darkened(0.4)
	if not loading:
		is_mouse_hovering = true
		$WaitTimer.start()

func _on_TweenGraph_mouse_exited() -> void:
#	Line.default_color = Line.default_color.inverted()
#	Line.default_color = line_color
	if not loading:
		is_mouse_hovering = false


func _on_WaitTimer_timeout() -> void:
	if is_mouse_hovering and not loading:
		$HBoxContainer/ImageContainer.start_demo(transition_type, ease_type)
