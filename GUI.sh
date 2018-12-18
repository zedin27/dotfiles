# SX preferences                                                              #
# ---------------------------------------------------------------------------- #

echo " Making my own Mac OS comfort :)"

SCREENSHOT_FOLDER=/Users/ztisnes/Desktop/Screenshots

mkdir -p $SCREENSHOT_FOLDER

# Set the default file format for screenshots to png
defaults write com.apple.screencapture type png

# Set default screenshot location to a specific folder
defaults write com.apply.screencapture location $SCREENSHOT_FOLDER

# Show hidden files by default in the Finder
defaults write com.apple.finder AppleShowAllFiles -bool TRUE

echo ""
echo "Power Chime"
defaults write com.apple.PowerChime ChimeOnAllHardware -bool true; open /System/Library/CoreServices/PowerChime.app &

# GUI ==========================================================================

# Enable Dark mode
defaults write NSGlobalDomain AppleInterfaceStyle Dark

# Always show scrollbars
defaults write NSGlobalDomain AppleShowScrollBars -string "Always"

# Increase window resize speed
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

# Hides all the desktop's icons
defaults write com.apple.finder CreateDesktop -bool false

# Expand save panel
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Disable Notification Center and remove the menu bar icon
launchctl unload -w \
/System/Library/LaunchAgents/com.apple.notificationcenterui.plist 2> /dev/null

echo "Done :D"
killall SystemUIServer
# ========================================================================== GUI
