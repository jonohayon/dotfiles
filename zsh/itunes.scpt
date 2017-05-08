-- A script that echos the currently playing iTunes track

if application "iTunes" is running then
  tell application "iTunes"
    if exists current track then
      set songName to the name of the current track
      set songArtist to the artist of the current track
      try
        -- Trim the string to a maximum length of 35 for better display
        if (length of songName) > 35 then
          set trimmedName to ((characters 1 thru 35 of songName) as string)
          return trimmedName & " - " & songArtist
        else
          return songName & " - " & songArtist
        end if
      on error err
      end try
    else
      return ""
    end if
  end tell
else
  return ""
end if
