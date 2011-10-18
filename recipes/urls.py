from django.conf.urls.defaults import *
from recipes import views

urlpatterns = patterns('',
	url(r'^create/$', views.create, name='recipe_create'),
	url(r'^latest/$', views.latest, name='recipe_latest'),
)
