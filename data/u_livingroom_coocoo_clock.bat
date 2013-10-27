if %cclock_used% equ 1 echo and & goto:eof
if %cclock_unlocked% equ 1 echo You stuff your muzzle into the hole and pull out some paper that seems to be & echo jamming the clockwork. Fluttershy squeaks at you. You got a letter! & set cclock_used=1& goto:eof
if %p_key% equ 0 echo You tug at the LUKE, but it doesn't open. It seems to be locked. & set p_key=1& goto:eof

echo You stuff your key into the lock and turn it, a small satisfying click making 
echo itself heard. You grin and open it.

set cclock_unlocked=1
set p_key=0

goto:eof

::THIS IS LOOK, NOT USE, AH!
echo A small coocoo clock hangs on the wall, it ticks away quietly. Though the little
echo hands of the clock do not move. There's a hatch under the visor(sp.)

echo A small coocoo clock hangs on the wall, it ticks away quietly. Though the little
echo hands of the clock do not move. There's seems to be some paper stuck inside the
echo hatch.

echo A small coocoo clock hangs on the wall, it ticks away quietly. The little hands
echo of the clock ticking away. Though it can't be showing the right hour anymore.
