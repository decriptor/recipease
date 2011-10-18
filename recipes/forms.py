from django import forms
from recipes.models import Recipe

class RecipeForm(forms.ModelForm):
	name = forms.CharField(max_length=340, widget=forms.Textarea)
	class Meta:
		model = Recipe
		fields = ('name',)
