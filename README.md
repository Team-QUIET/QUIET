# _QUIET_ - Development Git

## Installing Git-QUIET
Either download the latest master or clone the repository.

_Latest Master_

Download the latest master.
In your Forged Alliance folder, create a new sub-folder called "Git-QUIET".
Extract the master to the newly created Git-QUIET folder.

_Cloning the Repo_

In your Forged Alliance folder, create a new sub-folder called "Git-QUIET".
Clone the repository to that folder using your github client of choice.

_THEN_

You'll need to set up a shortcut to your Supcom executable with the following parameters:
/windowed 1366 768 /nomusic /nomovie /showlog /log "Loud-Dev.log" /init "..\Git-QUIET\bin\SupComDataPath.lua"

Put this shortcut in your Git-QUIET bin folder. Run the shortcut and wait for the game to open.
Once the game is open, create a new profile for development.

## Where are my maps?

Git-QUIET loads maps from the "Live" QUIET's 'maps' and 'usermaps' sub-folders. This lets us trim down the Git version from the Live version.
