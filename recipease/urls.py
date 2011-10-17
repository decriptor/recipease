from django.conf.urls.defaults import *
from django.views.generic.simple import direct_to_template
import settings

from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    (r'^$', 'recipease.recipe.views.index'),
    # Examples:
    # url(r'^$', 'recipease.views.home', name='home'),
    # url(r'^recipease/', include('recipease.foo.urls')),

    # Uncomment the admin/doc line below to enable admin documentation:
    # url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    url(r'^admin/', include(admin.site.urls)),

    # registration stuff
    (r'^accounts/', include('registration.urls')),

)

if settings.DEBUG:
	urlpatterns += patterns('',
		(r'^site_media/(?P<path>.*)$', 'django.views.static.serve', {
			'document_root': settings.MEDIA_ROOT,
			'show_indexes' :True
		}))
