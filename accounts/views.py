from django.db.models.query import QuerySet
from django.forms import BaseModelForm
from django.shortcuts import render
from django.urls import reverse_lazy
from django.views.generic import CreateView, FormView, UpdateView
from django.contrib.auth import authenticate, login, logout
from django.shortcuts import redirect
from .forms import CustomerCreationForm, CustomerChangeForm, LoginForm
from .models import Customer

class LoginView(FormView):
    template_name = 'login.html'
    form_class = LoginForm
    success_url = reverse_lazy("shop:products")

    def form_valid(self, form):
        username = form.cleaned_data['username']
        password = form.cleaned_data['password']
        user = authenticate(username=username, password=password)

        if user is not None:
            login(self.request, user)
            return super().form_valid(form)
        else:
            # Handle invalid login
            return self.form_invalid(form)
        

class SignUpView(CreateView):
    form_class = CustomerCreationForm
    success_url = reverse_lazy("shop:home")
    template_name = "signup.html"

    def form_valid(self, form):
        response = super().form_valid(form)        
        # Log in the user after successful registration
        login(self.request, self.object)
        return response


class UpdateView(UpdateView):
    form_class = CustomerChangeForm
    success_url = reverse_lazy("shop:home")
    template_name = "update.html"

    def get_object(self, queryset=None):
        return self.request.user

def logout_view(request):
    # Log out the user
    logout(request)
    return redirect("shop:home")

