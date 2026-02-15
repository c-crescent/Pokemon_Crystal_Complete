	object_const_def
	const FIGHTINGDOJO_POKE_BALL
	const FIGHTINGDOJO_BOSS

FightingDojo_MapScripts:
	def_scene_scripts
	
	def_callbacks
	callback MAPCALLBACK_OBJECTS, FightingDojoCallBack

FightingDojoCallBack:
	readvar VAR_BADGES
	ifless 16, .NormalDojo
	appear FIGHTINGDOJO_BOSS
	endcallback

.NormalDojo
	disappear FIGHTINGDOJO_BOSS
	endcallback

FightingDojoSign1:
	jumptext FightingDojoSign1Text

FightingDojoSign2:
	jumptext FightingDojoSign2Text

FightingDojoFocusBand:
	itemball FOCUS_BAND

BossScript:
	faceplayer
	opentext
	writetext BossBeforeText
	waitbutton
	closetext
	winlosstext BossDefeatText, 0
	loadtrainer BOSS, GIOVANNI
	checkflag ENGINE_HARD_MODE
	iffalse .normalmode_BOSS
	loadvar VAR_BATTLETYPE, BATTLETYPE_SETNOITEMS
.normalmode_BOSS
	startbattle
	disappear FIGHTINGDOJO_BOSS
	setevent EVENT_DEFEATED_BOSS
	reloadmapafterbattle
	end
FightingDojoSign1Text:
	text "What goes around"
	line "comes around!"
	done

FightingDojoSign2Text:
	text "Enemies on every"
	line "side!"
	done

BossBeforeText:
	text "What a surprise"
	line "to see you here."

	para "I see you have"
	line "overcome even"
	cont "the KANTO league."

	para "I must admit"
	line "to miss that"
	cont "competitive drive."

	para "How about a"
	line "friendly match?"
	done

BossDefeatText:
	text "That was good."

	para "Thank you for"
	line "the chance to"
	cont "finally stretch."

	para "I wish you"
	line "good luck."
	done	

FightingDojo_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4, 11, SAFFRON_CITY, 1
	warp_event  5, 11, SAFFRON_CITY, 1

	def_coord_events

	def_bg_events
	bg_event  4,  0, BGEVENT_READ, FightingDojoSign1
	bg_event  5,  0, BGEVENT_READ, FightingDojoSign2

	def_object_events
	object_event  3,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, FightingDojoFocusBand, EVENT_PICKED_UP_FOCUS_BAND
	object_event  5,  3, SPRITE_GIOVANNI, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BossScript, EVENT_DEFEATED_BOSS
