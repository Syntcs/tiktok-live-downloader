#!/bin/bash

check_stream_status() {
    stream_url="$1"
    status_code=$(curl -s -o /dev/null -w "%{http_code}" -q "$stream_url")
    if [ "$status_code" -ne 200 ]; then
        return 1
    fi
    return 0
}

generate_random_string() {
    cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w "${1:-8}" | head -n 1
}

format_duration() {
    local seconds=$1
    local hours=$((seconds / 3600))
    local minutes=$(((seconds % 3600) / 60))
    local seconds=$((seconds % 60))
    printf "%02d:%02d:%02d" $((hours + 1)) $minutes $seconds
}

clear

echo -e "\033[31m                                 _____ _ _    _____     _     \033[94m _     _                   "
echo -e "\033[31m                                |_   _(_) | _|_   _|__ | | __ \033[94m| |   (_)_   _____         "
echo -e "\033[31m                                  | | | | |/ / | |/ _ \| |/ / \033[94m| |   | \ \ / / _ \        "
echo -e "\033[31m                                  | | | |   <  | | (_) |   <  \033[94m| |___| |\ V /  __/        "
echo -e "\033[31m                                  |_| |_|_|\_\ |_|\___/|_|\_\ \033[94m|_____|_| \_/ \___|        "
echo -e "\033[37m                              ____                      _                 _           "
echo -e "\033[37m                             |  _ \  _____      ___ __ | | ___   __ _  __| | ___ _ __ "
echo -e "\033[37m                             | | | |/ _ \ \ /\ / / '_ \| |/ _ \ / _  |/ _  |/ _ \ '__|"
echo -e "\033[37m                             | |_| | (_) \ V  V /| | | | | (_) | (_| | (_| |  __/ |   "
echo -e "\033[37m                             |____/ \___/ \_/\_/ |_| |_|_|\___/ \__,_|\__,_|\___|_|   \033[0m"
echo -e ""
echo -e ""
echo -e "                                ⎹⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎸"
echo -e "                                ⎹             Script by Syntcs                 ⎸"
echo -e "                                ⎹ Github:    https://github.com/Syntcs         ⎸"
echo -e "                                ⎹ Discord:   https://discord.gg/r7pzvU3yWx     ⎸"
echo -e "                                ⎹⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎸"
echo -e ""
echo -e ""
echo -e ""
echo -e "                                           \033[4;33mEnter TikTok username\033[0m\033[0;96m"
read -p "                                           " TIKTOK_USERNAME

LIVESTREAM_URL="https://www.tiktok.com/@${TIKTOK_USERNAME}/live"
CURRENT_DATE=$(date +"%Y%m%d_%H%M" -d "+ 1 hour")
SCRIPT_DIR=$(dirname "$(realpath "$0")")
RANDOM_STRING=$(generate_random_string 8)

trap 'clear; stop_time=$(date +"%Y-%m-%d %H:%M:%S" -d "+ 1 hour");
            echo -e "\033[31m                                 _____ _ _    _____     _     \033[94m _     _                   ";
            echo -e "\033[31m                                |_   _(_) | _|_   _|__ | | __ \033[94m| |   (_)_   _____         ";
            echo -e "\033[31m                                  | | | | |/ / | |/ _ \| |/ / \033[94m| |   | \ \ / / _ \        ";
            echo -e "\033[31m                                  | | | |   <  | | (_) |   <  \033[94m| |___| |\ V /  __/        ";
            echo -e "\033[31m                                  |_| |_|_|\_\ |_|\___/|_|\_\ \033[94m|_____|_| \_/ \___|        ";
            echo -e "\033[37m                              ____                      _                 _           ";
            echo -e "\033[37m                             |  _ \  _____      ___ __ | | ___   __ _  __| | ___ _ __ ";
            echo -e "\033[37m                             | | | |/ _ \ \ /\ / /  _ \| |/ _ \ / _  |/ _  |/ _ \ __|";
            echo -e "\033[37m                             | |_| | (_) \ V  V /| | | | | (_) | (_| | (_| |  __/ |   ";
            echo -e "\033[37m                             |____/ \___/ \_/\_/ |_| |_|_|\___/ \__,_|\__,_|\___|_|   \033[0m";
            echo -e "";
            echo -e "";
            echo -e "                                ⎹⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎸";
            echo -e "                                ⎹             Script by Syntcs                 ⎸";
            echo -e "                                ⎹ Github:    https://github.com/Syntcs         ⎸";
            echo -e "                                ⎹ Discord:   https://discord.gg/r7pzvU3yWx     ⎸";
            echo -e "                                ⎹⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎸";
            echo -e "";
            echo -e "";
            echo -e "                                 \033[0;32m             Recording Completed                      \033[0m";
            echo -e "";
            echo -e "                                  @$TIKTOK_USERNAME | $LIVESTREAM_URL";
            echo -e "";
            echo -e "                                  Start: $start_time";
            echo -e "                                  Stop: $stop_time";
            echo -e "                                  Filename: $OUTPUT_FILE";
            echo -e "";
            echo -e "";
exit 1;' INT

while true; do
    if check_stream_status "$LIVESTREAM_URL"; then
        STREAM_URL=$(yt-dlp -g "$LIVESTREAM_URL" 2>/dev/null)
        echo -e "\033[0mloading"
        clear
        if [ -n "$STREAM_URL" ]; then
            OUTPUT_FILE="${CURRENT_DATE}_${RANDOM_STRING}.mp4"
            start_time=$(date +"%Y-%m-%d %H:%M:%S" -d "+ 1 hour")
            ffmpeg -i "$STREAM_URL" -c copy "$OUTPUT_FILE" >/dev/null 2>&1 &
            PID=$!
            clear
            echo -e "\033[31m                                 _____ _ _    _____     _     \033[94m _     _                   "
            echo -e "\033[31m                                |_   _(_) | _|_   _|__ | | __ \033[94m| |   (_)_   _____         "
            echo -e "\033[31m                                  | | | | |/ / | |/ _ \| |/ / \033[94m| |   | \ \ / / _ \        "
            echo -e "\033[31m                                  | | | |   <  | | (_) |   <  \033[94m| |___| |\ V /  __/        "
            echo -e "\033[31m                                  |_| |_|_|\_\ |_|\___/|_|\_\ \033[94m|_____|_| \_/ \___|        "
            echo -e "\033[37m                              ____                      _                 _           "
            echo -e "\033[37m                             |  _ \  _____      ___ __ | | ___   __ _  __| | ___ _ __ "
            echo -e "\033[37m                             | | | |/ _ \ \ /\ / / '_ \| |/ _ \ / _  |/ _  |/ _ \ '__|"
            echo -e "\033[37m                             | |_| | (_) \ V  V /| | | | | (_) | (_| | (_| |  __/ |   "
            echo -e "\033[37m                             |____/ \___/ \_/\_/ |_| |_|_|\___/ \__,_|\__,_|\___|_|   \033[0m"
            echo -e ""
            echo -e ""
            echo -e "                                ⎹⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎸"
            echo -e "                                ⎹             Script by Syntcs                 ⎸"
            echo -e "                                ⎹ Github:    https://github.com/Syntcs         ⎸"
            echo -e "                                ⎹ Discord:   https://discord.gg/r7pzvU3yWx     ⎸"
            echo -e "                                ⎹⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎸"
            echo -e ""
            echo -e ""
            echo -e "                                 Status: \033[0;32mrecording\033[0m"
            echo -e ""
            echo -e "                                 Streamer: @$TIKTOK_USERNAME"
            echo -e "                                 URL: $LIVESTREAM_URL"
            echo -e ""
            echo -e "                                 Started at: $CURRENT_DATE"
            echo -e "                                 File Name: $OUTPUT_FILE"
            while kill -0 $PID >/dev/null 2>&1; do
                if ! check_stream_status "$LIVESTREAM_URL"; then
                    break
                fi
                sleep 10
            done
            duration=$(ffmpeg -i "$OUTPUT_FILE" 2>&1 | grep "Duration" | cut -d ' ' -f 4 | sed 's/,//')
            stop_time=$(date +"%Y-%m-%d %H:%M:%S" -d "+ 1 hour")
            formatted_duration=$(format_duration "$(echo "$duration" | awk -F: '{ print ($1 * 3600) + ($2 * 60) + $3 }')")
            file_size=$(du -h "$OUTPUT_FILE" | cut -f1)
            clear
            echo -e "\033[31m                                 _____ _ _    _____     _     \033[94m _     _                   "
            echo -e "\033[31m                                |_   _(_) | _|_   _|__ | | __ \033[94m| |   (_)_   _____         "
            echo -e "\033[31m                                  | | | | |/ / | |/ _ \| |/ / \033[94m| |   | \ \ / / _ \        "
            echo -e "\033[31m                                  | | | |   <  | | (_) |   <  \033[94m| |___| |\ V /  __/        "
            echo -e "\033[31m                                  |_| |_|_|\_\ |_|\___/|_|\_\ \033[94m|_____|_| \_/ \___|        "
            echo -e "\033[37m                              ____                      _                 _           "
            echo -e "\033[37m                             |  _ \  _____      ___ __ | | ___   __ _  __| | ___ _ __ "
            echo -e "\033[37m                             | | | |/ _ \ \ /\ / / '_ \| |/ _ \ / _  |/ _  |/ _ \ '__|"
            echo -e "\033[37m                             | |_| | (_) \ V  V /| | | | | (_) | (_| | (_| |  __/ |   "
            echo -e "\033[37m                             |____/ \___/ \_/\_/ |_| |_|_|\___/ \__,_|\__,_|\___|_|   \033[0m"
            echo -e ""
            echo -e ""
            echo -e "                                ⎹⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎸"
            echo -e "                                ⎹             Script by Syntcs                 ⎸"
            echo -e "                                ⎹ Github:    https://github.com/Syntcs         ⎸"
            echo -e "                                ⎹ Discord:   https://discord.gg/r7pzvU3yWx     ⎸"
            echo -e "                                ⎹⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎸"
            echo -e ""
            echo -e ""
            echo -e "                                 \033[0;32m                    Recording Completed                      \033[0m"
            echo -e ""
            echo -e "                                  @$TIKTOK_USERNAME | $LIVESTREAM_URL"
            echo -e "                                  Start: $start_time"
            echo -e "                                  Stop: $stop_time"
            echo -e "                                  Filename: $OUTPUT_FILE"
            echo -e "                                  Filesize: $file_size"
            echo -e "                                  Duration: $formatted_duration"
        else
            clear
            echo -e "\033[31m                                 _____ _ _    _____     _     \033[94m _     _                   "
            echo -e "\033[31m                                |_   _(_) | _|_   _|__ | | __ \033[94m| |   (_)_   _____         "
            echo -e "\033[31m                                  | | | | |/ / | |/ _ \| |/ / \033[94m| |   | \ \ / / _ \        "
            echo -e "\033[31m                                  | | | |   <  | | (_) |   <  \033[94m| |___| |\ V /  __/        "
            echo -e "\033[31m                                  |_| |_|_|\_\ |_|\___/|_|\_\ \033[94m|_____|_| \_/ \___|        "
            echo -e "\033[37m                              ____                      _                 _           "
            echo -e "\033[37m                             |  _ \  _____      ___ __ | | ___   __ _  __| | ___ _ __ "
            echo -e "\033[37m                             | | | |/ _ \ \ /\ / / '_ \| |/ _ \ / _  |/ _  |/ _ \ '__|"
            echo -e "\033[37m                             | |_| | (_) \ V  V /| | | | | (_) | (_| | (_| |  __/ |   "
            echo -e "\033[37m                             |____/ \___/ \_/\_/ |_| |_|_|\___/ \__,_|\__,_|\___|_|   \033[0m"
            echo -e ""
            echo -e ""
            echo -e "                                ⎹⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎺⎸"
            echo -e "                                ⎹             Script by Syntcs                 ⎸"
            echo -e "                                ⎹ Github:    https://github.com/Syntcs         ⎸"
            echo -e "                                ⎹ Discord:   https://discord.gg/r7pzvU3yWx     ⎸"
            echo -e "                                ⎹⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎽⎸"
            echo -e ""
            echo -e ""
            echo -e "                                 \033[41m                    ERROR                      \033[0m"
            echo -e ""
            echo -e "                                       Could not retrieve the direct stream URL"
            echo -e "                                Check if \033[94;47m$TIKTOK_USERNAME\033[0m is online or the username is correct"
            echo -e "                                       \033[0;105mScript will be restarted in 60 seconds\033[0m"
        fi
    fi
    sleep 60
done
