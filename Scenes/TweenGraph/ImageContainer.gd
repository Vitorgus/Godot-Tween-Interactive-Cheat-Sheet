extends MarginContainer

var fade_time := 0.2
var is_animating := false

func _ready() -> void:
	var image_width = $Sprite.texture.get_width()
	$Sprite.offset = Vector2(image_width/2, 0)
	$Sprite.scale = Vector2(rect_size.x/image_width, rect_size.x/image_width)
	$Sprite.position = Vector2(0, rect_size.y)

func start_demo(transition_type: int, ease_type: int) -> void:
	if not is_animating:
		is_animating = true
		$Sprite.position = Vector2(0, rect_size.y)
		$ImageTween.interpolate_property($Sprite, "modulate", Color(1, 1, 1, 0), Color(1, 1, 1, 1), fade_time, Tween.TRANS_LINEAR, Tween.EASE_IN)
		$ImageTween.interpolate_property($Sprite, "position:y", rect_size.y, 0, 1.5, transition_type, ease_type, fade_time)
		$ImageTween.start()


func _on_ImageTween_tween_completed(object: Object, key: NodePath) -> void:
	if object == $Sprite and key == ":position:y":
		$ImageTween.interpolate_property($Sprite, "modulate", Color(1, 1, 1, 1), Color(1, 1, 1, 0), fade_time, Tween.TRANS_LINEAR, Tween.EASE_IN)
		$ImageTween.start()
	elif object == $Sprite and key == ":modulate":
		if $Sprite.modulate == Color(1, 1, 1, 0):
			is_animating = false

func modulate_pointer(color: Color) -> void:
	$Sprite.self_modulate = color
