extends Node2D


signal stat_changed(new_val, stat_idx)


class Stat:
	
	var max_val
	var cur_val
	
	func _init(max_val, cur_val = null) -> void:
		self.max_val = max_val
		if cur_val == null:
			self.cur_val = self.max_val
		else:
			self.cur_val = cur_val
	
	func change_cur_val(new_val: int) -> int:
		if new_val > max_val:
			cur_val = max_val
			return max_val - new_val
		else:
			cur_val = new_val
			return 0
			
	func add(dt_val: int) -> int:
		return self.change_cur_val(cur_val + dt_val)
