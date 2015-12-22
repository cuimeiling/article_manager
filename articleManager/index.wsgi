import sae

from articleManager import wsgi

application = sae.create_wsgi_app(wsgi.application)