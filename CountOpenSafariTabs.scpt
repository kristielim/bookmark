-- CountOpenSafariTabs.scpt
-- Author: Chad Armstrong
-- Date: 13 May 2016
-- Description: Count the number of open tabs in Safari
-- To run from CLI: osascript CountOpenSafariTabs.scpt

on run argv
tell application "Safari"
	
	--Variables
	set winlist to every window
	set totaltabcount to 0
	
	-- Loop through each window to count the number of open tabs
	repeat with win in winlist
	set output to ""
		try
			set tabcount to number of tabs in win
			repeat with i from 1 to tabcount
				tell application "Safari"
					set output to (output & item 1 of argv & " " & URL of tab i of win & "\n")
				end tell
			end repeat
		on error errmsg
			-- Often getting error message like this: 
			-- "Safari got an error: AppleEvent handler failed."
			-- log "error message: " & errmsg
		end try
	end repeat
	return output
	
end tell
end run