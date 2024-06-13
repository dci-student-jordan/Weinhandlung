from django.contrib import admin

# Register your models here.

from django.contrib.auth.admin import UserAdmin

from .forms import CustomerCreationForm, CustomerChangeForm
from .models import Customer

# class CustomerAdmin(UserAdmin):
#     add_form = CustomerCreationForm
#     form = CustomerChangeForm
#     model = Customer
#     list_display = ["email", "username",]

admin.site.register(Customer)