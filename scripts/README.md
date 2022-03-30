# Little Helper Scripts
These are addons to the main program that help with configuring runs. etc...

## scripts_pathmagic.py
This file sorts the sys.path out. So that modules can be imported as if they
they were in the project root folder.
Such that the scripts can be now be independently run from any path.

All of the imports in the scripts (after importing scripts_pathmagic)
work as if the script was in the project_root 

NOTE: some IDEs/Linters may flag the import as an error. Even though it's valid
code
