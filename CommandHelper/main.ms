assign(@msg, array('','&c           [ CommandBlock Extention ]','&7             제작 리턴 (Nunseol_Nem)','&7             빌드 2016.7.22 18:13',''))
for(@i=0, @i<length(@msg), @i++){
	broadcast(colorize(@msg[@i]))
}

bind(player_interact,null,null,@event,
	if(@event['block'] == 137){ if(split(':',@event['item'])[0] == 386){
			close_pinv(player())
			if(get_itemmeta(pheld_slot(player()))['pages'] == '{}'){ cancel() } else {
				assign(@commands, split('\n',replace(replace(get_itemmeta(pheld_slot(player()))['pages'] ,'{',''),'}','')))
				for(@i=0, @i<length(@commands), @i++){
					if(@i == length(@commands)-1 ){
						#execute function
						set_block_command(@event['location'], '/runalias /runas '.player().' /'. @commands[@i])
						set_block_at(@event['location'][x],integer(@event['location'][y])+1,@event['location'][z], 152)
						set_block_at(@event['location'][x],integer(@event['location'][y])+1,@event['location'][z], 0)
					} else { sudo('/runalias /runas '.player().' /'. @commands[@i]) }
				}
			}
	} }
)

bind(player_join, null, null, @event,
	assign(@msg, array('','&c           [ CommandBlock Extention ]','&7             제작 리턴 (Nunseol_Nem)','&7             빌드 2016.7.22 18:13',''))
	for(@i=0, @i<length(@msg), @i++){ msg(colorize(@msg[@i])) } 
)
/**
bind(player_death, null, null, @event,
	array @items = array()
	array @ev = @event['drops']
	for(@i=0, @i<length(@ev), @i++){
		if(@ev[@i]['type'] == '386'){
			array_push(@items, @ev[@i])
			modify_event(@event['drops'], array_remove(@event['drops'], @i))
			@i--
		}
	}
	store_value(player().lastitem, @items)
)
bind(item_pickup,null,null,@event,
	if(not(@event['item']['meta'] == null)){
		broadcast(@event['item']['type'])
	}
)
bind(item_drop,null,null,@event,
	if(@event['item']['meta'] == null){
		cancel()
		broadcast(pitem_slot(player(),@event['item']['type']))
	}
)**/
	