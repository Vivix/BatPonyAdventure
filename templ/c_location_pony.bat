::=======================
:: NAAAAAAAAAAAAmEEEEEE
:: ALWAYS REMEMBER TO SET ENDLOCAL WHEN EXITING CONVERSATION!
:: WE NEED SOMEWAY TO RETURN TO THE CONVERSATOIN IF THE USER TYPES BULLSHIT
::=======================
setlocal
::MACROS=======
set cecho=echo( 
::BODY=========
::				Entry
:entry_0

call return_point answers
endlocal & goto:eof
::				Answers
:entry_1
goto:eof
::FUNCTIONS====
:c_choice
set /p c_buf=:
if [%c_buf%] equ [] goto %1
if %c_buf% equ 0 goto %1
find/i ":%2_%c_buf%" %~f0 >nul && goto %2_%c_buf%
echo What was that? & goto %1
goto:eof