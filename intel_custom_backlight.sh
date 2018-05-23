#!/bin/bash

# STEP1 - step, when backlight level is below BOUNDARY_LEVEL
STEP1=1
# step2 - step, when backlight level is above BOUNDARY_LEVEL
STEP2=10
# boundary level, where step value changes
BOUNDARY_LEVEL="0x00bb0010"
# min brightness
MIN_LEVEL="0x00bb0000"
# max brightness
MAX_LEVEL="0x00bb00bb"

IFS=' ' read -ra VAL <<< "$(intel_reg read 0xC8254)"
CUR_VALUE=${VAL[2]}
NEW_VALUE="$CUR_VALUE"

if [ "$1" == "up" ]; then
	if (( "$CUR_VALUE" < "$MAX_LEVEL" )); then
		if (( "CUR_VALUE" > "BOUNDARY_LEVEL" )); then
        		NEW_VALUE="$((CUR_VALUE+STEP2))"
		else
			NEW_VALUE="$((CUR_VALUE+STEP1))"
		fi
	fi
fi

if [ "$1" == "down" ]; then
	if (( "$CUR_VALUE" > "$MIN_LEVEL" )); then
		if (( "CUR_VALUE" > "BOUNDARY_LEVEL" )); then
			NEW_VALUE="$((CUR_VALUE-STEP2))"
		else
			NEW_VALUE="$((CUR_VALUE-STEP1))"
		fi
	fi
fi

val=$(printf '%#010x\n' "$NEW_VALUE")
echo "New value: $val"
intel_reg write 0xC8254 "${val}"
