set /p VERSION="Build version: "
git clone https://github.com/HearthSim/HSReplay
cd HSReplay\python
git clone https://github.com/HearthSim/python-hearthstone
mv python-hearthstone\hearthstone hearthstone
python setup.py install
cd ..\..
xcopy /y cx_freeze.py HSReplay\python\cx_freeze.py*
xcopy /y hearthsim.ico HSReplay\python\hearthsim.ico*
cd HSReplay\python
python cx_freeze.py build
cd ..\..
mkdir build
mv HSReplay\python\build\exe.win32-3.4\hsreplayconverter.exe build\hsreplayconverter.exe
mv HSReplay\python\build\exe.win32-3.4\pyexpat.pyd build\pyexpat.pyd
mv HSReplay\python\build\exe.win32-3.4\python34.dll build\python34.dll
rd HSReplay /s /q
@echo %VERSION%>> build/version
python create_zip.py %VERSION%
rd build /s /q