from django import template


def recipe(context, r):
	to_return = {
		'recipe':r,
		#'request': context['request'],
	}
	if context['user'].is_authenticated():
		to_return.update({
			'authenticated': True,
		})
	else:
		to_return['authenticated'] = False
	return to_return

register = template.Library()

register.inclusion_tag('recipes/archive.html', takes_context=True)(recipe)
