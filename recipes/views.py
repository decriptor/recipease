from recipes.models import Recipe
from recipes.forms import RecipeForm

from django.shortcuts import render_to_response, get_object_or_404
from django.http import HttpResponseRedirect, HttpResponse
from django.template import RequestContext
from django.core.urlresolvers import reverse

def index(request):
	recipes = Recipes.objects.today().filter(latest=True)
	context = {
		'recipes': recipes,
	}

	return render_to_response('recipes/index.html', context_instance=RequestContext(request))

def latest(request):
	recipes = Recipe.objects.today().filter(latest=True)
	context = {
		'recipes' : recipes,
	}
	return render_to_response(
		'recipes/latest.html',
		context,
		context_instance = RequestContext(request),
	)

def create(request):
	form = RecipeForm(request.POST or None)
	if form.is_valid():
		recipe = form.save(commit=False)
		recipe.creator = request.user
		recipe.start_date = None
		recipe.save()
		request.user.message_set.create(message='Your recipe was added')
		if 'next' in request.POST:
			next = request.POST['next']
		else:
			next = reverse('recipe_latest')
		return HttpResponseRedirect(next)
	return render_to_response(
		'recipes/create.html',
		{'form':form},
		context_instance = RequestContext(request)
	)
