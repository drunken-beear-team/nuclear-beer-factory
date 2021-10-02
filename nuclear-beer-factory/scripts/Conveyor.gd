extends StaticBody2D


export(float) var _speed: float = 200


func _ready() -> void:
	constant_linear_velocity.x = _speed


func _process(delta: float) -> void:
	$Sprite.texture.region.position.x += -(_speed) * delta
