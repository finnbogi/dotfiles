#!/bin/sh

set -eo

# Function to get the workspace number for an application
get_workspace() {
    case $1 in
        "spotify")
            echo "4:  Spotify"
            ;;
        "code"|"cursor")
            echo "3:  Code"
            ;;
        "obsidian")
            echo "5:  Obsidian"
            ;;
        "thunderbird")
            echo "10:  Mail"
            ;;
        "brave")
            echo "2:  Brave"
            ;;
        *)
            echo "8"
            ;;
    esac
}


# Function to check if a process is running
is_running() {
    case $1 in
        "obsidian")
            pgrep --full "electron /usr/lib/obsidian/app.asar" > /dev/null
            ;;
        "code")
            pgrep --full "electron /usr/lib/code/code.js" > /dev/null
            ;;
        *)
            pgrep -x "$1" > /dev/null
            ;;
    esac
}

# Function to start an application
start_or_focus_app() {
    case $1 in
        "obsidian")
            obsidian &
            ;;
        "thunar")
            if [ -n "$2" ]; then
                thunar "$2" &
            elif ! is_running "thunar"; then
                thunar &
            else
                i3-msg [class="Thunar"] focus
            fi
            ;;
        "brave")
            if [ -n "$2" ]; then
                brave "$2" &
            elif ! is_running "brave"; then
                brave &
            else
                i3-msg [class="Brave-browser"] focus
            fi
            ;;
        *)
            if ! is_running "$1"; then
                "$1" &
            fi
            #"$1" &
            ;;
    esac
}

# Check if an argument is provided
if [ $# -eq 0 ]; then
    echo "Please provide an application name as an argument."
    exit 1
fi

app="$1"
context="$2"
workspace=$(get_workspace "$app")

# Check if the process is running
if is_running "$app"; then
    # If running, switch to its workspace
    i3-msg workspace number "$workspace"
else
    # If not running, switch to the workspace and start the process
    i3-msg workspace number "$workspace"
    start_or_focus_app "$app" "$context"
fi

# # Check if an argument is provided
# if [ $# -eq 0 ]; then
#     echo "Please provide an application name as an argument."
#     exit 1
# fi

# app="$1"
# workspace=$(get_workspace "$app")

# # Check if the process is running
# if $app == "obsidian"; then
    
# if pgrep -x "$app" > /dev/null; then
#     # If running, switch to its workspace
#     i3-msg workspace number "$workspace"
# else
#     # If not running, switch to the workspace and start the process
#     i3-msg workspace number "$workspace"
#     "$app" &
# fi
