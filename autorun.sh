echo ""echo "Set up a global .gitignore in to the root dir"
git config --global core.excludesfile '~/.gitignore'

echo ""
echo "Disable opening and closing window animations"
defaults write NSGlobalDomain NSAutomaticWindowAnimationsEnabled -bool false

echo ""
echo "Increase window resize speed for Cocoa applications"
defaults write NSGlobalDomain NSWindowResizeTime -float 0.001

echo ""
echo "Always open everything in Finder's list view. This is important."
defaults write com.apple.Finder FXPreferredViewStyle Nlsv

echo ""
echo "Show the ~/Library folder."
chflags nohidden ~/Library

echo ""
echo "Expand save panel by default"
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true

echo ""
echo "Trackpad: enable tap to click for this user and for the login screen"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

echo ""
echo "Trackpad: map bottom right corner to right-click"
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 2
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true
defaults -currentHost write NSGlobalDomain com.apple.trackpad.trackpadCornerClickBehavior -int 1
defaults -currentHost write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -bool true

echo ""
echo "Disable press-and-hold for keys in favor of key repeat."
defaults write -g ApplePressAndHoldEnabled -bool false

echo ""
echo "Finder: disable window animations and Get Info animations"
defaults write com.apple.finder DisableAllAnimations -bool true

echo ""
echo "Disable the warning when changing a file extension"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

echo ""
echo "Use list view in all Finder windows by default"
defaults write com.apple.Finder FXPreferredViewStyle -string "Nlsv"
#echo "Four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`"

echo ""
echo "Enable highlight hover effect for the grid view of a stack (Dock)"
defaults write com.apple.dock mouse-over-hilite-stack -bool true

echo ""
echo "Automatically hide and show the Dock"
defaults write com.apple.dock autohide -bool true

echo ""
echo "Enable the Develop menu and the Web Inspector in Safari"
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true

echo ""
echo "Don’t automatically rearrange Spaces based on most recent use"
defaults write com.apple.dock mru-spaces -bool false

echo ""
if [ ! "$?" -eq 0 ] ; then
	echo "Installing Homebrew..."
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

echo ""
echo "Latest version and upgrade"
brew update && brew upgrade

echo ""
echo "Installing node..."
brew install node

echo ""
echo "Installing Golang"
brew install go

echo ""
echo "Installing python3"
brew install python3

echo ""
echo "Installing docker"
brew install docker

echo ""
echo "Installing n node version manager"
npm i -g n

echo ""
echo "Installing autojump"
brew install autojump

echo ""
echo "Installing zsh and setting zsh as your main shell"
brew install zsh
sudo dscl . -create /Users/$USER UserShell /usr/local/bin/zsh

echo ""
echo "Cleaning outdated versions from the cellar"
brew cleanup

echo ""
echo "Installing Water-Reminder"
git clone https://github.com/zedin27/Water-Reminder
mv Water-Reminder ../

echo ""
echo "Create new npm global directory and set it as prefix"
mkdir ~/.npm-global
npm config set prefix '~/.npm-global'

for app in "Address Book" "Calendar" "Contacts" "Dashboard" "Dock" "Finder" \
	"Mail" "Safari" "SystemUIServer" "Terminal" "Transmission" \
	"Twitter" "iTunes"; do
	killall "$app" > /dev/null 2>&1
done

echo "Done. Note that some of these changes require a logout/restart to take effect."
