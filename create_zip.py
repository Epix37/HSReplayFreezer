#!/usr/bin/env python
import os
import sys
import zipfile

filename = "hsreplay-" + sys.argv[1] + ".zip"
zf = zipfile.ZipFile(filename, "w", zipfile.ZIP_DEFLATED)
for dir, subdir, files in os.walk("build"):
    for file in files:
        zf.write(os.path.join(dir, file), file)
zf.close()