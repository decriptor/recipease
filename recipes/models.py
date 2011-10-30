from django.db import models
from datetime import datetime, timedelta
from django.contrib.auth.models import User
from django.db.models.query import QuerySet

class UserProfile (models.Model):
	'''
		This is for any additional profile attributes
		Things provided by the built in User are:
		  first_name
		  last_name
		  email
		  username
	'''
	user = models.OneToOneField (User)
	phone = models.CharField(max_length=15)
	created = models.DateTimeField()

	def __unicode__(self):
		return self.user.first_name + ' ' + self.user.last_name

def today():
	now = datetime.now()
	start = datetime.min.replace(year=now.year, month=now.month,
			day=now.day)
	end = (start + timedelta(days=1)) - timedelta.resolution
	return (start, end)

class RecipeQuerySet(QuerySet):
	def today(self):
		return self.filter(creation_date__range=today())

class RecipeManager(models.Manager):
	def get_query_set(self):
		return RecipeQuerySet(self.model)

	def today(self):
		return self.get_query_set().today()

class Recipe (models.Model):
	name = models.CharField (max_length=200)
	creation_date = models.DateTimeField(default=datetime.now)
	creator = models.ForeignKey(User, related_name='recipe_creator_set')
	latest = models.BooleanField(default=True)

	objects = RecipeManager()

	def __unicode__(self):
		return self.name

	def save(self, **kwargs):
		Recipe.objects.filter(latest=True,
				creator=self.creator).today().update(latest=False)
		super(Recipe, self).save(**kwargs)

	class Meta(object):
		verbose_name_plural = "Recipes"
	

class Meal (models.Model):
	name = models.CharField (max_length=200)
	description = models.TextField()


	def __unicode__(self):
		return self.name

class Ingredient (models.Model):
	name = models.CharField (max_length=200)
	description = models.TextField()


	def __unicode__(self):
		return self.name

