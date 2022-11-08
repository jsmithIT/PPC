@echo off
echo .SYNOPSIS
echo A batch script to calculate the priority of a package.
echo Authors: JBSMITH
echo Version: 1.0.0

:: Gets user input
set /p USERIMPACT="How many people would be affected? "
set /p ITIMPACT="How complex is the manual installation, out of 10 (10 being very complex)? "
set /p COST="How complex will the package be, out of 10 (10 being very complex)? "
set /p EXCEPTION="How convenient would it be if the application was packaged, out of 10 (10 being very convenient)? "
set /p DEPIMPACT="How important is the department out of 10 (10 being high visibility and impact)? "
:: Number of County employees divided by 10.
set num1=80

:: Calculates the priority score based on the pros and cons given.
set /a Impact1=%USERIMPACT%/%num1%
set /a Pros=%Impact1%+%ITIMPACT%+%EXCEPTION%+%DEPIMPACT%
set /a Score=%Pros% - %COST%

:: Informs the user of the calculation.
if %Score% LSS 20 (
 echo This package scored a %Score%/40 for priority. This is a low priority package.
)
if %Score% GTR 20 (
 echo This package scored a %Score%/40 for priority. This is a high priority package.
)
if %Score% EQU 20 (
echo This package scored a %Score%/40 for priority. This is a medium priority package.
)

pause