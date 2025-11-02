@echo off
REM Enable delayed expansion, which is needed for variables that change inside a loop
SETLOCAL ENABLEDELAYEDEXPANSION

REM This line is the Windows equivalent of N=${1:-10}
REM It checks if the first argument (%1) is empty. If it is, set N to 10.
IF "%1"=="" (
    SET "N=10"
) ELSE (
    SET "N=%1"
)

REM Initialize variables
SET "A=0"
SET "B=1"

echo "The Fibonacci series is : "
echo "Index   Value"
echo "-------------"

REM Calculate the end of the loop (N-1)
SET /A "LOOP_END=N-1"

REM This is the Windows 'FOR' loop equivalent of 'for (( i=0; i<N; i++ ))'
REM It loops from 0, in steps of 1, until it reaches LOOP_END
FOR /L %%i IN (0, 1, !LOOP_END!) DO (
    
    REM 'echo -e "$i\t$a"' replacement.
    REM We use spaces because batch 'echo' doesn't handle tab (\t) characters.
    echo %%i       !A!
    
    REM 'fn=$((a + b))' replacement
    SET /A "FN=A+B"
    
    REM 'a=$b' replacement
    SET "A=!B!"
    
    REM 'b=$fn' replacement
    SET "B=!FN!"
)

ENDLOCAL

