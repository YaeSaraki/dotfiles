#!/bin/bash

music=(
	background.padding_right=0
	background.padding_left=4
	background.color=$BG_SEC_COLR

	script="$PLUGIN_DIR/music.sh"
	click_script="open -a /Applications/NetEaseMusic.app"
)

sketchybar --add alias 'NetEaseMusic' right \
	   --set 'music' "${music[@]}"
