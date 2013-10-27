::=======================
:: Fluttershy, livingroom.
:: ALWAYS REMEMBER TO SET ENDLOCAL WHEN EXITING CONVERSATION!
:: WE NEED SOMEWAY TO RETURN TO THE CONVERSATOIN IF THE USER TYPES BULLSHIT
::=======================
setlocal
::MACROS=======
set cecho=echo( 
::BODY=========
::				Entry
:entry_0
echo Oh, hello there!
%cecho% 1. What's going on?
%cecho% 2. Who are you?
%cecho% 3. Who's Queen Dawn?
call:c_choice entry_0 entry
endlocal & goto:eof
::				Answers
:entry_1
echo Uhm, well... We need the letter to stop Queen Dawn. I don't - uhm - know why.
goto:eof
:entry_2
echo Y-you don't remember me!? I- Oh, my... I knew this was a bad idea... Uhm, maybe
echo you should hurry up with that letter? So we could... get out?
%cecho% 1. Sure I remember you! I can't forget you!
%cecho% 2. Well, I'm sure I'll remember you once we get out!
%cecho% 3. Bad idea?
call:c_choice entry_2 memory
goto:eof
:entry_3
echo Oh, she's a... really mean pr-pony, queen. She's stolen our Twilight, and we
echo need the letter to get her back!
%cecho% 1. Really?
%cecho% 2. Okay.
call:c_choice entry_3 queen
goto:eof

:queen_1
echo Oh, yes! It's... very important. I can't even imagine what would happen if we
echo fail!
goto:eof
:queen_2
echo It's true...!
goto:eof

:memory_1
echo Oh, thank the princesses! I was so worried you'd forgotten about me! Don't 
echo scare me like that again.
goto:eof
:memory_2
echo I sure hope so...
goto:eof
:memory_3
echo T-that hiding in here was a bad idea! C-cause otherwise we'd be out and you
echo wouldn't have passed out and... uhm, yes; bad idea.
%cecho% 1. How long I out?
%cecho% 2. What happened to me?
%cecho% 3. Right. Well, I'll look for the letter now!
call:c_choice memory_3 passout
goto:eof

:passout_1
echo Just half an hour, I think.
goto:memory_3
:passout_2
echo W-well! Uh, you - fell. You fell onto your face.
goto:eof 
:passout_3
goto:eof

::FUNCTIONS====
:c_choice
set /p c_buf=:
if [%c_buf%] equ [] goto %1
if %c_buf% equ 0 goto %1
find/i ":%2_%c_buf%" %~f0 >nul && goto %2_%c_buf%
echo What was that? & goto %1
goto:eof