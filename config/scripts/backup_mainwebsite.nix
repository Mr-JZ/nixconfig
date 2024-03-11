{ pkgs, username }:

pkgs.writeShellScriptBin "backup_mainwebsite" ''
# Set the directory to check for changes. Change this to your specific context directory.
GIT_DIR="/home/${username}/github/main-website"
CONTENT_DIR="src/content"
ASSETS_DIR="src/assets"

# Change to your git repository directory
cd $GIT_DIR

# Check if the current branch is main
CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
if [ "$CURRENT_BRANCH" != "main" ]; then
    echo "Not on the main branch. Current branch is $CURRENT_BRANCH. Exiting..."
    exit 1
fi

# Fetch the latest changes. This is important to ensure we have an up-to-date view of the main branch.
git fetch

# Check if the branch is behind the remote and needs pulling
if git status | grep -q 'Your branch is behind'; then
    echo "Your branch is behind its upstream counterpart. Pulling changes..."
    git pull
fi

# Check for changes in the context directory
if git diff --quiet HEAD $CONTENT_DIR $ASSETS_DIR ; then
    echo "No changes detected in $CONTENT_DIR or in $ASSETS_DIR."
else
    echo "Changes detected in $CONTENT_DIR or in $ASSETS_DIR. Committing and pushing changes..."

    # Add changes to staging
    git add $CONTENT_DIR $ASSETS_DIR

    # Get the current date and time for the commit message
    CURRENT_DATETIME=$(date "+%Y-%m-%d %H:%M:%S")

    # Commit the changes with a message that includes the current date and time and a brief description
    git commit -am "Update on $CURRENT_DATETIME: Changes detected in context directory."

    # Push the changes to the main branch
    git push origin main

    echo "Changes pushed to main branch."
fi
''
