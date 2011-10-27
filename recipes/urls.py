from django.conf.urls.defaults import *
from django.contrib.auth.decorators import login_required
from recipes import views

urlpatterns = patterns('',
	url(r'^create/$', views.create, name='recipe_create'),
	url(
		r'^latest/$',
		login_required(views.latest),
		{'everyone': False},
		name='recipe_latest'
	),
	url(
		r'^archive/$',
		login_required(views.archive),
		name='recipe_archive'
	),
)
