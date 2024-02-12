{ pkgs }:

pkgs.writeShellScriptBin "meditation" ''
# Directory containing the videos
VIDEO_DIR="$HOME/Nextcloud/Pictures/meditation"

# Select a random video from the directory
VIDEO_FILE=$(find "$VIDEO_DIR" -type f | shuf -n 1)

# Check if a video file was found
if [ -z "$VIDEO_FILE" ]; then
    echo "No video files found in the specified directory."
    exit 1
fi

# Play the video using mpv
hyprctl keyword windowrulev2 float,class:\(mpv\)
mpv "$VIDEO_FILE"
sleep 1
hyprctl keyword windowrulev2 unset,class:\(mpv\)
''

