from django.conf.urls.defaults import *
from django.contrib.auth.decorators import login_required
from django.views.generic.list_detail import object_list
import settings

from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
	url(r'^$', 'views.index', name="index"),
	url(r'^about/$', 'django.views.generic.simple.direct_to_template',
		{'template': 'misc/about.html'}, name="about"),
	url(r'^help/$', 'django.views.generic.simple.direct_to_template',
		{'template': 'misc/help.html'}, name="help"),
	url(
        r'^settings/$',
        'django.views.generic.simple.direct_to_template',
        {'template': 'misc/settings.html'},
        name='settings'
    ),
    (r'^recipes/', include('recipes.urls')),
    (r'^admin/', include(admin.site.urls)),
    (r'^accounts/', include('registration.urls')),
    (r'^accounts/login/$', 'django.contrib.auth.views.login'),
    #    (r'^$', 'recipease.recipe.views.index'),
)

if settings.DEBUG:
	urlpatterns += patterns('',
		(r'^media/(?P<path>.*)$', 'django.views.static.serve', {
			'document_root': settings.MEDIA_ROOT,
			'show_indexes' :True
		}))
