%~z1

@echo off
setlocal
set file="BGMain.exe"
set bytesize=7843886

FOR /F "usebackq" %%A IN ('%file%') DO set size=%%~zA
IF EXIST BGMain-BG2-PolishSagaBG.exe del BGMain-BG2-PolishSagaBG.exe
if %size% EQU %bytesize% (
    echo.File size is ^< %bytesize% bytes and it's BGMain-BG2-Saga
    rename BGMain.exe BGMain-BG2-PolishSagaBG.exe
    ping 127.0.0.1 >nul
    bspatch.exe BGMain-BG2-PolishSagaBG.exe BGMain.exe BGMain-BG2-ToB-5CD-2.5.26498-PL.patch
    echo Conversion of polish BGMain.exe from "Saga Baldur's Gate" edition done > BGMain.txt
    ping 127.0.0.1 >nul
    del bspatch.exe
    del BGMain-BG2-PolishSagaBG.exe
    del BGMain-BG2-ToB-5CD-2.5.26498-PL.patch
    del BGMain-BG2-PolishSagaBGConversion.bat
) ELSE (
    echo.File size is ^>= %bytesize% bytes and it's other version, no conversion needed
)