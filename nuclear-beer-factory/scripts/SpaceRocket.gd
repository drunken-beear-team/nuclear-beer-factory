extends StaticBody2D


signal earned_money(bottle_amount)


var _cur_bottles_count = 0


func _on_SpaceRocketEater_eated(eatable_type):
	if eatable_type == EatableType.BOTTLE:
		print(1)
		_cur_bottles_count += 1
		if _cur_bottles_count >= Values.V_ROCKET_CAP:
			$AnimationPlayer.play("Fly")
			emit_signal("earned_money", _cur_bottles_count)
			_cur_bottles_count = 0
