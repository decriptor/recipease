from django.conf.urls.defaults import *
import settings

from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    (r'^recipes/', include('recipes.urls')),
#    (r'^$', 'recipease.recipe.views.index'),

    url(r'^admin/', include(admin.site.urls)),

    (r'^accounts/', include('registration.urls')),
    (r'^accounts/login/$', 'django.contrib.auth.views.login'),

)

if settings.DEBUG:
	urlpatterns += patterns('',
		(r'^media/(?P<path>.*)$', 'django.views.static.serve', {
			'document_root': settings.MEDIA_ROOT,
			'show_indexes' :True
		}))
