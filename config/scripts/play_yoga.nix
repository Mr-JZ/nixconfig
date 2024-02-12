{ pkgs }:

pkgs.writeShellScriptBin "yoga" ''
# Directory containing the videos
VIDEO_DIR="$HOME/Nextcloud/Pictures/yoga"

# Select a random video from the directory
VIDEO_FILE=$(find "$VIDEO_DIR" -type f | shuf -n 1)

# Check if a video file was found
if [ -z "$VIDEO_FILE" ]; then
    echo "No video files found in the specified directory."
    exit 1
fi

# Play the video using mpv
playerctl pause
hyprctl keyword windowrulev2 float,class:\(mpv\)
mpv "$VIDEO_FILE"
sleep 1
hyprctl keyword windowrulev2 unset,class:\(mpv\)
playerctl play
''
