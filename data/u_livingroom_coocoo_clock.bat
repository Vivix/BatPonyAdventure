if %cclock_used% equ 1 echo and & goto:eof
if %cclock_unlocked% equ 1 echo You stuff your muzzle into the hole and pull out some paper that seems to be & echo jamming the clockwork. Fluttershy squeaks at you. You got a letter! & set cclock_used=1& goto:eof
if %p_key% equ 0 echo You tug at the hatch, but it doesn't open. It seems to be locked. & goto:eof

echo You stuff your key into the lock and turn it, a small satisfying click making 
echo itself heard. You grin.

set cclock_unlocked=1
set p_key=0

goto:eof
