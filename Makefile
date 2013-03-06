.PHONY: computer_name menu_bar
COMPUTER_NAME=slimjim

setup: computer_name menu_bar

computer_name:
	sudo scutil --set ComputerName $(COMPUTER_NAME)
	sudo scutil --set HostName $(COMPUTER_NAME)
	sudo scutil --set LocalHostName $(COMPUTER_NAME)
	sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string $(COMPUTER_NAME)

menu_bar:
	# Menu bar: transparency
	# false: disables transparency
	# true: enables transparency
	defaults write NSGlobalDomain AppleEnableMenuBarTransparency -bool false

	# Menu bar: battery percentage
	# "NO": disable displaying percentage
	# "YES": enable displaying percentage
	defaults write com.apple.menuextra.battery ShowPercent -string "NO"

	# show remaining battery time (on pre-10.8); hide percentage
	# Menu bar: remaining battery time
	# "YES": enable display of remaining battery time
	# "NO": disable display of remaining battery time
	defaults write com.apple.menuextra.battery ShowTime -string "YES"
	
	# Menu bar: hide the useless Time Machine and Volume icons
	defaults write com.apple.systemuiserver menuExtras -array "/System/Library/CoreServices/Menu Extras/Bluetooth.menu" "/System/Library/CoreServices/Menu Extras/AirPort.menu" "/System/Library/CoreServices/Menu Extras/Battery.menu" "/System/Library/CoreServices/Menu Extras/Clock.menu"
