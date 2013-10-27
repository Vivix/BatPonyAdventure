::=======================
:: Livingroom table
:: ALWAYS REMEMBER TO SET ENDLOCAL WHEN EXITING CONVERSATION!
:: WE NEED SOMEWAY TO RETURN TO THE CONVERSATOIN IF THE USER TYPES BULLSHIT
::=======================
setlocal
::MACROS=======
set cecho=echo( 
::BODY=========
:entry
echo You stare at the table for a while.
%cecho% 1. Talk to me, damnit!
%cecho% 2. I love you!
%cecho% 3. Please, table. I really need you right now.
:entry_prompt
call:c_choice entry_prompt
goto:eof
::WARNING!! THIS WILL FAIL IF THE NAME CHANGES, PLEASE USE A REPLACER INSTEAD! (What will fail? What?)

:1
echo The table cooly refuses to respond.
goto:eof & endlocal
:2
echo The table rejects you with crushing silence.
goto:eof & endlocal
:3
echo Silence. This table is heartless!
goto:eof & endlocal
::FUNCTIONS====
:c_choice
set /p c_buf=:
if [%c_buf%] equ [] goto %1
find/i ":%c_buf%" %~f0 >nul && goto %c_buf%
echo What was that? & goto %1
goto:eof