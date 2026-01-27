; Maps that roaming monsters can be on, and possible maps they can jump to.
; Notably missing are Route 40 and Route 41, which are water routes.

DEF __roam_maps__ = 0

MACRO roam_map
	map_id \1
	db _NARG - 1
	rept _NARG - 1
		map_id \2
		shift
	endr
	db 0
	DEF __roam_maps__ += 1
ENDM

RoamMaps:
	; start map, ...other maps
	roam_map ROUTE_46, ROUTE_45, ROUTE_29
	roam_map ROUTE_46, ROUTE_45, ROUTE_29
	roam_map ROUTE_46, ROUTE_45, ROUTE_29
	roam_map ROUTE_46, ROUTE_45, ROUTE_29
	roam_map ROUTE_46, ROUTE_45, ROUTE_29
	roam_map ROUTE_46, ROUTE_45, ROUTE_29
	roam_map ROUTE_46, ROUTE_45, ROUTE_29
	roam_map ROUTE_46, ROUTE_45, ROUTE_29
	roam_map ROUTE_46, ROUTE_45, ROUTE_29
	roam_map ROUTE_46, ROUTE_45, ROUTE_29
	roam_map ROUTE_46, ROUTE_45, ROUTE_29
	roam_map ROUTE_46, ROUTE_45, ROUTE_29
	roam_map ROUTE_46, ROUTE_45, ROUTE_29
	roam_map ROUTE_46, ROUTE_45, ROUTE_29
	roam_map ROUTE_46, ROUTE_45, ROUTE_29
	roam_map ROUTE_46, ROUTE_45, ROUTE_29
	db -1 ; end

	assert __roam_maps__ == NUM_ROAMMON_MAPS, \
		"RoamMaps: expected {d:NUM_ROAMMON_MAPS} entries, got {d:__roam_maps__}"
