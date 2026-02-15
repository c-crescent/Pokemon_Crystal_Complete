CreditsScript:

; Clear the banner.
	db CREDITS_CLEAR

; Pokemon Crystal Version Staff
	db                STAFF, 1

	db CREDITS_WAIT, 8

; Play the credits music.
	db CREDITS_MUSIC

	db CREDITS_WAIT2, 10

	db CREDITS_WAIT, 1

; Update the banner.
	db CREDITS_SCENE, 2 ; Ditto

	db             CREATEDBY, 1
	db       		VIVIANDK, 2

	db CREDITS_WAIT, 12

; Clear the banner.
	db CREDITS_CLEAR

	db CREDITS_WAIT, 1

; Display "The End" graphic.
	db CREDITS_THEEND

	db CREDITS_WAIT, 20

	db CREDITS_END
