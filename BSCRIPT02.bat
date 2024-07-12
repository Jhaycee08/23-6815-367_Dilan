@echo off
:menu
echo ---------------------------------------------------
echo Which shape would you like to calculate the area of?
echo ---------------------------------------------------
echo 1. Circle
echo 2. Triangle
echo 3. Quadrilateral
echo 4. Exit

set /p x="Enter your choice:"
if %x%==4 goto end
if %x%==3 goto Quadrilateral
if %x%==2 goto Triangle
if %x%==1 goto Circle
:Circle
    echo Enter the radius of the Circle:
    set /p radius=
    set /a r=%radius%
    set /a pi=3.14
    echo ....
    set /a Area=%pi%*%r%*%r%
    echo The area is %Area%
    pause
    cls
    goto menu

:Triangle
    echo Enter the first side of the Triangle:
    set /p side1=
    echo Enter the second side of the Triangle:
    set /p side2=
    echo Enter the third side of the Triangle:
    set /p side3=
    set /a s1=%side1%
    set /a s2=%side2%
    set /a s3=%side3%

    echo ...
    set /a perimeter=%s1% + %s2% + %s3%
    set /a s=%perimeter%/2
    set /a area=%s% * ((%s%-%s1%) * (%s%-%s2%) * (%s%-%s3%))
    call :SquareRoot %area%
    echo The area of the Triangle is %answer%
    
    if %s2% EQU %s3% (
        if %s1% EQU %s2% (
            if %s1% EQU %s3% (
                echo Triangle is an Equilateral.
                pause
                cls
                goto :menu
            )
        )
    ) 
    
    if %s1% NEQ %s2% (
        if %s1% NEQ %s3% (
            if %s2% NEQ %s3% (
                echo Triangle is a Scalene.
                pause
                cls
                goto :menu
            )
        )
    ) else (
        echo Triangle is an Isosceles.
        pause
        cls
        goto :menu
    )
    
:SquareRoot
    SETLOCAL EnableDelayedExpansion
    set root=1
    set /a sqr=%root%*%root%
    :Loop
    if %sqr% LSS %area% (
        set /a root=!root!+1
        set /a sqr=!root!*!root!
        goto Loop
    )
    (EndLocal && set answer=%root% && exit /B)

:Quadrilateral
    echo Enter the length of the Quadrilateral:
    set /p length=
    echo Enter the width of the Quadrilateral:
    set /p width=
    set /a l=%length%
    set /a w=%width%
    echo...
    set /a area=%l%*%w%
    echo Area of the Quadrilateral is %area%
    if %l%==%w% (
        echo Quadrilateral is Square
    ) else (
        echo Quadrilateral is a Rectangle
    )
    pause
    cls
    goto menu
:end    
echo ---------------------------------
pause