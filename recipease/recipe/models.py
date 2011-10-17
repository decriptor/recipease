from django.db import models
from django.contrib.auth.models import User

class UserProfile (models.Model):
	user = models.OneToOneField (User)

class Recipe (models.Model):
	name = models.CharField (max_length=200)


class Meal (models.Model):
	name = models.CharField (max_length=200)
	description = models.CharField (max_length=500)

class Ingredient (models.Model):
	name = models.CharField (max_length=200)
	description = models.CharField (max_length=500)
