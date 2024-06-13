from django.contrib import admin
from .models import Product, ProductVintage, ReservedOrder, Purchase

# Register your models here.

admin.site.register(Product)
admin.site.register(ProductVintage)
admin.site.register(ReservedOrder)
admin.site.register(Purchase)