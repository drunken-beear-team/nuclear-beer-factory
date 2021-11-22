extends AudioStreamPlayer

export(Resource) var explode_sound 
export(Resource) var buy_sound 
export(Resource) var bottle_sound 
export(Resource) var launch_sound 
export(Resource) var bag_in_beer_sound 



func play_explode():
	if !is_playing():
		stream = explode_sound
		play()


func play_buy():
	if !is_playing():
		stream = buy_sound
		play()


func play_bottle():
	if !is_playing():
		stream = bottle_sound
		play()


func play_launch():
	if !is_playing():
		stream = launch_sound
		play()


func play_bag_in_beer():
	if !is_playing():
		stream = bag_in_beer_sound
		play()


# I will die in hell for this code ^^^


func _on_SpaceRocket_earned_money(bottle_amount):
	play_launch()


func _on_StatController_stat_changed(stat_idx, new_val):
	if stat_idx == 1:
		play_buy()


func _on_Silo_poped_beer():
	play_bag_in_beer()

func _on_Silo_poped_beer_aaa():
	play_bottle()
