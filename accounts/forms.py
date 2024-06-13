# accounts/forms.py
from django.contrib.auth.forms import UserCreationForm, UserChangeForm
from django import forms

from .models import Customer

class LoginForm(forms.Form):
    username = forms.CharField()
    password = forms.CharField(widget=forms.PasswordInput)

class CustomerCreationForm(UserCreationForm):
    class Meta(UserCreationForm.Meta):
        model = Customer
        fields = UserCreationForm.Meta.fields + ("first_name", "last_name", "email", 'address',)

class CustomerChangeForm(UserChangeForm):
    password = None
    class Meta(UserChangeForm.Meta):
        model = Customer
        fields = ["username", "first_name", "last_name", "email", "address"]