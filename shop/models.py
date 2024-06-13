from django.db import models
from .choices import STATE_CHOICES, ORDER_CHOICES
from django.db.models import Sum

# Create your models here.

class Product(models.Model):
    name = models.CharField(max_length=255)
    description = models.TextField()

    def __str__(self):
        return self.name

class ProductVintage(models.Model):
    product = models.ForeignKey(Product, on_delete=models.CASCADE)
    vintage = models.IntegerField()
    vintage_description = models.TextField()
    price = models.DecimalField(max_digits=6, decimal_places=2)
    stock = models.PositiveIntegerField()

    def __str__(self):
        return f"{self.product} - {self.vintage}"
    
    @property
    def available_stock(self):
        # Calculate the total quantity of reserved orders with a state lower than three
        reserved_quantity = ReservedOrder.objects.filter(product=self, state__lt=2).aggregate(Sum('quantity'))['quantity__sum'] or 0
        # Subtract the reserved quantity from the available stock
        return self.stock - reserved_quantity

class ReservedOrder(models.Model):
    # product is actually the vintage!
    product = models.ForeignKey(ProductVintage, on_delete=models.SET_NULL, null=True, default=None, related_name='vintages')
    quantity = models.PositiveIntegerField()
    customer = models.ForeignKey('accounts.Customer', on_delete=models.SET_NULL, null=True, default=None, related_name='userorders')
    ordered_at = models.DateTimeField(auto_now_add=True)
    state = models.IntegerField(choices=ORDER_CHOICES, default=0, null=True, blank=True)

    def __str__(self):
        return f"{self.product}, Amount: {self.quantity}, Price: {self.product.price} €, Total: {self.product.price * self.quantity} €"
    

class Purchase(models.Model):
    orders = models.ManyToManyField(ReservedOrder)
    total_price = models.DecimalField(max_digits=8, decimal_places=2, default=0.00)
    purchased_at = models.DateTimeField(auto_now_add=True)
    state = models.IntegerField(choices=STATE_CHOICES, default=0, null=True, blank=True)