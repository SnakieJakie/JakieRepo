@echo off
                                                                                                    

::KrazeeTobi's PK3 compiler, edited by SnakieJakie.
TITLE Tobi Compiler (Glacier)
echo KrazeeTobi's PK3 compiler, edited by SnakieJakie.
echo NOTE: This BAT file expects to be in a directory with a "Src" folder in it. Picky asshole. 

:: I'll have 2 number 9s... 

set /p _filename?=File Name?:
echo -
set /p _vernum?=Verison number?: 
echo -
set /p _MoveToCompiledFolder?=When done, move it to a "Compiled" folder? (Useful if you don't want your main folder to be messy. 1: Yes, 0: No): 
echo -
set /p _zipPk3Pk7=PK3 or ZIP? (PK3=1, ZIP=2): 


::  Get the order
if %_zipPk3Pk7% equ 2 goto COMPILE_ZIP
if %_zipPk3Pk7% equ 1 goto COMPILE_PK3




:COMPILE_ZIP
echo -
echo Ready to compile. Just waiting for your mark.
pause
"%ProgramFiles%\7-Zip\7z.exe" a %_filename?%_%_vernum?%.zip -tzip .\Src\* -x!*.pk3 -x!*.bat -x!*.gitignore -x!*.gitattributes -x!"*git\"
echo Done compiling! 
if %_MoveToCompiledFolder?% equ 1 goto DOMOVE_ZIP
echo -
if %_MoveToCompiledFolder?% equ 0 goto DONE
echo -


:COMPILE_PK3
echo Ready to compile. Just waiting for your mark.
pause
"%ProgramFiles%\7-Zip\7z.exe" a %_filename?%_%_vernum?%.pk3 -tzip .\Src\* -x!*.pk3 -x!*.bat -x!*.gitignore -x!*.gitattributes -x!"*git\"
echo -
echo Done compiling! 
echo -
if %_MoveToCompiledFolder?% equ 1 goto DOMOVE_PK3
if %_MoveToCompiledFolder?% equ 0 goto DONE


:DOMOVE_PK3
Move %_filename?%_%_vernum?%.pk3 Compiled\

:DONE
echo -
echo We're done, go to bed.
Pause
Exit


