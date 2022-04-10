@echo off

IF EXIST s2built.bin move /Y s2built.bin s2built.prev.bin >NUL
asm68k /k /p /o ae-,c+ Sonic2B.asm, s2built.bin >s2.log, , s2.lst