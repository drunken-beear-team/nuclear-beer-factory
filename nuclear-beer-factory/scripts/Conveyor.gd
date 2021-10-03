extends StaticBody2D


export(float) var _speed: float = 200


onready var _sprite: Sprite = get_node(@"Sprite")


func _ready() -> void:
	constant_linear_velocity.x = _speed


func _process(delta: float) -> void:
	_sprite.texture.region.position.x += -(_speed) * delta
