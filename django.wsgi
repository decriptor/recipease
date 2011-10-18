import os
import sys
sys.stdout = sys.stderr
sys.path.insert(0, '/srv/www/vhosts/www.recipease.us')

os.environ['DJANGO_SETTINGS_MODULE'] = 'recipease.settings'

import django.core.handlers.wsgi
application = django.core.handlers.wsgi.WSGIHandler()
