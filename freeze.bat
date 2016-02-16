set CX_FREEZE=C:\Python34\Scripts\cxfreeze

git clone https://github.com/HearthSim/HSReplay
cd HSReplay\python
git clone https://github.com/HearthSim/python-hearthstone
mv python-hearthstone\hearthstone hearthstone
python setup.py install
python %CX_FREEZE% convert.py
cd ..\..
mv HSReplay\python\dist\convert.exe convert.exe
mv HSReplay\python\dist\pyexpat.pyd pyexpat.pyd
mv HSReplay\python\dist\python34.dll python34.dll
rd HSReplay /s /q
