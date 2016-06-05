
minetest.register_privilege("mesemaker", {description = "Able to use all mesecons.", give_to_singleplayer=false})

-- listed nodes require mesemaker priv for placement
-- to add additional nodes, insert new entries into mese_list

local mese_list = {
	"mesecons_commandblock:commandblock_off",
	"mesecons_blinkyplant:blinky_plant_off",
	"mesecons_detector:object_detector_off",
	"mesecons_luacontroller:luacontroller0000",
	"mesecons_microcontroller:microcontroller0000",
	"mesecons_pistons:piston_sticky_off",
	"mesecons_pistons:piston_up_sticky_off",
	"mesecons_pistons:piston_down_sticky_off",
	"mesecons_pistons:piston_normal_off",
	"mesecons_pistons:piston_up_normal_off",
	"mesecons_pistons:piston_down_normal_off",
	"mesecons_delayer:delayer_off_1",
	"mesecons_noteblock:noteblock",
	"mesecons_hydroturbine:hydro_turbine_off",
	"mesecons_movestones:movestone",
	"mesecons_movestones:sticky_movestone",
}

for mesecount = 1, #mese_list do
	minetest.override_item(mese_list[mesecount], {
		on_place = function(itemstack, placer, pointed_thing)
			local can_mess = minetest.check_player_privs(placer.get_player_name(placer), {mesemaker=true})
			if not can_mess then
				minetest.chat_send_player(placer:get_player_name(), "You're not allowed to use this.")
				return
			end
			return minetest.item_place(itemstack, placer, pointed_thing)
		end	
	})
end




