from .models import Product, ProductVintage, ReservedOrder, Purchase
from django import forms

from .choices import STATE_CHOICES, ORDER_CHOICES

class CustomerOrderForm(forms.ModelForm):
    '''Form for customers to place an order'''
    class Meta:
        model = ReservedOrder
        fields = ['product', 'quantity']

    def __init__(self, *args, **kwargs):
        super(CustomerOrderForm, self).__init__(*args, **kwargs)


class CustomerOrderDeleteForm(forms.ModelForm):
    '''Form for customers to delete their reserved order'''
    class Meta:
        model = ReservedOrder
        fields = []

    def __init__(self, *args, **kwargs):
        super(CustomerOrderDeleteForm, self).__init__(*args, **kwargs)

class StaffOrderForm(forms.ModelForm):
    '''Form for staff to update the state of an order'''
    class Meta:
        model = ReservedOrder
        fields = ['state']
    
    def __init__(self, *args, **kwargs):
        super(StaffOrderForm, self).__init__(*args, **kwargs)
        self.fields['state'].widget.attrs['class'] = 'form-select'
        self.fields['state'].choices = ORDER_CHOICES

        
class StaffPurchaseForm(forms.ModelForm):
    '''Form for staff to update the state of a purchase'''
    class Meta:
        model = Purchase
        fields = ['state']
    
    def __init__(self, *args, **kwargs):
        super(StaffPurchaseForm, self).__init__(*args, **kwargs)
        self.fields['state'].widget.attrs['class'] = 'form-select'
        self.fields['state'].choices = STATE_CHOICES
        

class ProductForm(forms.ModelForm):
    '''Form for staff to create and update products'''
    class Meta:
        model = Product
        fields = ['name', 'description']


class ProductVintageForm(forms.ModelForm):
    '''Form for staff to create and update products'''
    class Meta:
        model = ProductVintage
        fields = ['product', 'vintage', 'vintage_description', 'price', 'stock']

class CustomerPaymentForm(forms.ModelForm):
    '''Form for customers to simulate payment of a purchase'''
    class Meta:
        model = Purchase
        fields = ['state']

    def __init__(self, *args, **kwargs):
        super(CustomerPaymentForm, self).__init__(*args, **kwargs)
        self.fields['state'].widget.attrs['class'] = 'form-select'
        self.fields['state'].choices = STATE_CHOICES