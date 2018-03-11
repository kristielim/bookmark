on run argv
tell application "Google Chrome"

	set winlist to every window
	set output to ""
	
	repeat with win in winlist
		set tabcount to number of tabs in win
				repeat with i from 1 to tabcount
					set output to (output & item 1 of argv & " " & URL of tab i of win & "\n")
				end repeat
	end repeat
	return output
	
end tell
end run