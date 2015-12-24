import sae

from articleManager import wsgi

application = sae.create_wsgi_app(wsgi.application)
from sae.ext.storage import monkey
monkey.patch_all()