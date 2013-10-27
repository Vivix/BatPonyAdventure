	::Why not? -Dospony
@echo off
setlocal
set buffer=
set end=0
echo -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
echo Welcome to a short adventure in Equestria!
echo -=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-
echo(

	::set up for events.
set p_key=0
set cclock_used=0
set cclock_unlocked=0
set u_fluttershy_nudged=0

	::set up basic character.
:character_setup

set/p name=What is your name? 
echo Welcome to this quickie, %name%!
set/p buffer=Hey, tell me, are you a mare or a stallion? 

	::decipher response.
:gender
if /i "%buffer%" == "mare" goto g_mare
if /i "%buffer%" == "stallion" goto g_stallion
if /i "%buffer%" == "both" goto g_both

echo Could you repeat that? I didn't quite catch it...
set/p buffer=Just, whisper it into my ear. 
goto gender

	::This is where you set up "her", and other pronouns to be automatically replaced.
:g_mare
set gender=mare
set _gnd=0
goto game_begin
:g_stallion
set gender=stallion
set _gnd=1
goto game_begin
:g_both
echo Oh, my!
set gender=both
set _gnd=2
goto game_begin

	::Todo, create a better print function? cut by word to keep under 80
:game_begin
echo(
echo Well, welcome %name%!
echo(
echo(
type data\intro
set location=livingroom
	::KNOWN BUG: Passing % and such can destroy the game. Don't do that.
:game_loop
set/p buffer=^>
call :proc_command %buffer%
if %end% EQU 1 goto end
goto game_loop

	::Destroy safely.
:end
endlocal
goto :eof

	::funcs. vThis bulky mare is the core of this game.
:proc_command
if /i %1 == look goto c_look
if /i %1 == use goto c_use
if /i %1 == talk goto c_talk
if /i %1 == go goto c_go
if /i %1 == exit goto c_ex
goto c_unk

:c_look
setlocal
if [%2] EQU [] type data\%location%_description & goto:eof
if /i [%2] EQU [at] (set _subj=%3) ELSE (set _subj=%2)
	::aliases.
for /f "delims=: tokens=2" %%G in ('type data\alias ^| find/i ":%_subj%:"') do if NOT [%%G]==[] set _subj=%%G
if exist data\%location%_%_subj% type data\%location%_%_subj% & endlocal & goto:eof
 	::if it is not a clear description, it might have a script attached to it
if exist data\%location%_%_subj%_s.bat call data\%location%_%_subj%_s.bat & endlocal & goto:eof
	::no we do not know what it is
echo I don't know what that is, I think...
endlocal
goto:eof

:c_use
	::USES BATCH STUFF. NEEDS TO CHECK EVENTS.
if exist data\u_%location%_%2 type data\u_%location%_%2 & goto:eof
if exist data\u_%location%_%2.bat call data\u_%location%_%2.bat & goto:eof
echo I don't think that'll work.
goto:eof

:c_talk
	::USES BATCH STUFF. NEEDS TO KNOW EVENTS, AND USE REPLACEMENTS. AS WELL AS HAVE LOGIC FOR TALKING.
	if exist data\conv\c_%location%_%2 type data\conv\c_%location%_%2 & goto:eof
	if exist data\conv\c_%location%_%2.bat call data\conv\c_%location%_%2.bat & goto:eof
	echo I don't see anyone with that name here.
goto:eof

:c_go
	::Find valid locations from our standpoint.
	find/i "%2" data\%location%_exits >nul || goto:eof
	set location=%2
	echo type look to see description of room.
goto:eof

:c_ex
set end=1
goto:eof

:c_unk
echo What?
goto:eof
::END_PROC_COMMAND

:print_help
echo Help!
goto:eof
