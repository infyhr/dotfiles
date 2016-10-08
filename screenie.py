#!/usr/bin/env python2
# -*- coding: utf-8 -*-
import os # In order to execute `import`
import uuid # To generate a uniqid
from subprocess import Popen, PIPE

def main():
    # Generate a uniqid.
    result = uuid.uuid1()

    # Call import and save a screen.
    os.system('import /tmp/%s.png' % (result));

    # scp to upload it.
    os.system('scp -q -P 6996 -i /home/infy/.ssh/electra /tmp/%s.png infy@...:/home/infy/www/pub/ekran/%s.png' % (result, result))

    # put it in the clipboard.
    p = Popen(['xsel','-pi'], stdin=PIPE)
    p.communicate(input='http://infy.cybershade.org/ekran/%s.png' % (result))
    p = Popen(['xsel','-bi'], stdin=PIPE)
    p.communicate(input='http://infy.cybershade.org/ekran/%s.png' % (result))

    # let me knwo it's up
    os.system('notify-send --icon=gtk-info screenie.py %s.png' % (result))

if __name__ == '__main__':
    main()
