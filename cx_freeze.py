import sys
from cx_Freeze import setup, Executable

exe = Executable(
      script="convert.py",
      targetName="hsreplayconverter.exe",
      icon="hearthsim.ico")
setup(
    name = "hsreplayconverter",
    executables = [exe])