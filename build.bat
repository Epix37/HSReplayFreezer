set CX_FREEZE=C:\Python34\Scripts\cxfreeze
set /p VERSION="Build version: "
git clone https://github.com/HearthSim/HSReplay
cd HSReplay\python
git clone https://github.com/HearthSim/python-hearthstone
mv python-hearthstone\hearthstone hearthstone
python setup.py install
python %CX_FREEZE% convert.py
cd ..\..
mkdir build
mv HSReplay\python\dist\convert.exe build\hsreplayconverter.exe
mv HSReplay\python\dist\pyexpat.pyd build\pyexpat.pyd
mv HSReplay\python\dist\python34.dll build\python34.dll
rd HSReplay /s /q
@echo %VERSION%>> build/version
python create_zip.py %VERSION%
rd build /s /q