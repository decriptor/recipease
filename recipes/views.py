from recipes.models import Recipe
from recipes.forms import RecipeForm

from django.shortcuts import render_to_response, get_object_or_404
from django.http import HttpResponseRedirect, HttpResponse
from django.template import RequestContext
from django.core.urlresolvers import reverse
from django.contrib.auth.decorators import login_required

def index(request):
	recipes = Recipes.objects.today().filter(latest=True)
	context = {
		'recipes': recipes,
	}

	return render_to_response('recipes/index.html', context_instance=RequestContext(request))

def latest(request, everyone=True):
	recipes = Recipe.objects.today().filter(latest=True)
	if request.user.is_authenticated():
		my_recipes = recipes.filter(creator=request.user)
		recipes = recipes.exclude(creator=request.user)
	else:
		my_recipes = Recipe.objects.none()
		
	context = {
		'recipes' : recipes,
		'my_recipes' : my_recipes,
		'recipe_form' : RecipeForm(),
	}
	return render_to_response(
		'recipes/latest.html',
		context,
		context_instance = RequestContext(request),
	)

def archive(request, everyone=True):
	recipes = Recipe.objects.filter(latest=True)
	
	context = {
		'recipes' : recipes,
	}
	return render_to_response(
		'recipes/archive.html',
		context,
		context_instance = RequestContext(request),
	)

@login_required
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

