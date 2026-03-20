#!/bin/bash

# Pagaidām mazu brīdi, lai paziņojumu dēmons paspēj ielādēties
sleep 5

last_notified=0

while true; do
    # Atrodam pirmo pieejamo bateriju
    BAT_PATH=$(ls -d /sys/class/power_supply/BAT* | head -n 1)
    
    if [ -d "$BAT_PATH" ]; then
        bat_level=$(cat "$BAT_PATH/capacity")
        bat_status=$(cat "$BAT_PATH/status")

        # Ja līmenis ir 15% vai zemāk un dators izlādējas
        if [ "$bat_level" -le 15 ] && [ "$bat_status" = "Discharging" ]; then
            # Sūtām paziņojumu tikai tad, ja procents ir mainījies
            if [ "$last_notified" -ne "$bat_level" ]; then
                notify-send -u critical "ZEMS AKUMULATORA LĪMENIS!" "Atlikuši vairs tikai $bat_level%" -i battery-low
                last_notified=$bat_level
            fi
        fi
    fi
    # Pārbaudām reizi minūtē
    sleep 60
done
