on list2string(theList, theDelimiter)
	set theBackup to AppleScript's text item delimiters
	set AppleScript's text item delimiters to theDelimiter
	set theString to theList as string
	set AppleScript's text item delimiters to theBackup
	return theString
end list2string

tell application "Finder"
	set sel to item 1 of (get selection)
	if class of sel is folder then
		set currentDir to sel as text
	else
		set currentDir to (container of sel) as text
	end if
end tell
set oldDelimiters to AppleScript's text item delimiters
set AppleScript's text item delimiters to "/"
set pathStr to every text item of (POSIX path of currentDir)
set AppleScript's text item delimiters to oldDelimiters
if item 2 of pathStr is "Volumes" then
	if (count of pathStr) ³ 4 then
		if item 3 of pathStr is "public" then
			set sshCommand to "cd /home/shares/public/" & list2string((items 4 thru -2 of pathStr), "/") & "; bash --login"
		else
			set sshCommand to "cd /home/" & item 3 of pathStr & "/" & list2string((items 4 thru -2 of pathStr), "/") & "; bash --login"
		end if
		tell application "Terminal"
			do script "ssh " & item 3 of pathStr & "@home.local -t " & (quoted form of sshCommand)
		end tell
	else
		display dialog "Incorrect network location" buttons {"OK"} default button "OK"
	end if
else
	display dialog "Current folder is not a network location" buttons {"OK"} default button "OK"
end if

