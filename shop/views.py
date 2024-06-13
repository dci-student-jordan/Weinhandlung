from django.http import HttpResponse
from django.shortcuts import render, get_object_or_404, redirect
from django.views.generic.detail import DetailView
from django.views.generic.list import ListView
from django.views.generic.edit import CreateView, UpdateView, DeleteView
from .models import Product, ProductVintage, ReservedOrder, Purchase
from accounts.models import Customer
from .forms import *
from django.urls import reverse_lazy
from django.contrib.auth.mixins import UserPassesTestMixin, LoginRequiredMixin
from django.db.models import Q, F, FloatField, ExpressionWrapper, Value
from django.db import transaction
from datetime import datetime
from django.http import JsonResponse
import json
from collections import defaultdict

# Create your views here.

def index(request):
    return render(request, 'shop/index.html')

class ProductListView(ListView):
    '''View for listing all products'''
    model = Product
    template_name = 'shop/product_list.html'
    context_object_name = 'products'

class ProductVintageListView(ListView):
    '''View for listing all vintages of a product'''
    model = ProductVintage
    template_name = 'shop/product_vintage_list.html'
    context_object_name = 'vintages'
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        if "pk" in self.kwargs:
            context['product'] = Product.objects.get(id=self.kwargs['pk'])
        else:
            self.template_name = 'shop/vintages_list.html'
        return context
    
    def get_queryset(self):
        if "pk" in self.kwargs:
            return ProductVintage.objects.filter(product=self.kwargs['pk'])
        else:
            vintages = ProductVintage.objects.all().order_by('vintage')
            # Grouping by vintage
            vintages_grouped = defaultdict(list)
            for vintage in vintages:
                vintages_grouped[vintage.vintage].append(vintage)
            vintages = dict(vintages_grouped)
            return vintages

class ProductDetailView(DetailView):
    '''View for displaying a single product'''
    model = Product
    template_name = 'shop/product_detail.html'
    context_object_name = 'product'

class ProductVintageDetailView(DetailView):
    '''View for displaying a single vintage of a product'''
    model = ProductVintage
    template_name = 'shop/product_vintage_detail.html'
    context_object_name = 'vintage'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['vintage'] = ProductVintage.objects.get(id=self.kwargs['pk'])
        return context


class ProductCreateView(LoginRequiredMixin, UserPassesTestMixin, CreateView):
    '''View for staff to create products'''
    model = Product
    form_class = ProductForm
    template_name = 'shop/product_create.html'
    success_url = reverse_lazy('shop:products')

    def get(self, request, *args, **kwargs):
        self.set_vintage_form(request)
        return super().get(request, *args, **kwargs)
    
    def post(self, request, *args, **kwargs):
        self.set_vintage_form(request)        
        post = super().post(request, *args, **kwargs)
        return post
    
    def set_vintage_form(self, request):
        if "vintage" in request.path:
            self.template_name = "shop/product_vintage_create.html"
            self.form_class = ProductVintageForm
            self.model = ProductVintage
            product_id = request.GET.get('product')
            if product_id:
                self.initial = {'product': product_id}
    
    def form_valid(self, form):
        # Save the form and get the saved object
        saved_object = form.save()
        
        if "vintage" in self.request.path:
            # Redirect to the vintages view with the saved object's ID
            return redirect('shop:vintages', pk=saved_object.product.id)
        
        return super().form_valid(form)


    def test_func(self):
        # Only staff members can create products
        return self.request.user.is_staff


class ProductUpdateView(LoginRequiredMixin, UserPassesTestMixin, UpdateView):
    '''View for staff to update products'''
    model = Product
    form_class = ProductForm
    template_name = 'shop/product_update.html'
    success_url = reverse_lazy('shop:products')

    def set_vintage_form(self, request):
        if "vintage" in request.path:
            self.template_name = "shop/product_vintage_update.html"
            self.form_class = ProductVintageForm
            self.model = ProductVintage
            self.success_url = reverse_lazy('shop:vintages', kwargs={'pk': self.get_object().product.id})

    def post(self, request, *args, **kwargs):
        self.set_vintage_form(request)
        return super().post(request, *args, **kwargs)

    def get(self, request, *args, **kwargs):
        self.set_vintage_form(request)
        return super().get(request, *args, **kwargs)

    def test_func(self):
        # Only staff members can update products
        return self.request.user.is_staff

class ProductDeleteView(LoginRequiredMixin, UserPassesTestMixin, DeleteView):
    '''View for staff to delete products'''
    model = Product
    template_name = 'shop/product_delete.html'
    success_url = reverse_lazy('shop:products')

    def set_vintage_form(self, request):
        if "vintage" in request.path:
            self.template_name = "shop/product_vintage_delete.html"
            self.model = ProductVintage
            self.success_url = reverse_lazy('shop:vintages', kwargs={'pk': self.get_object().product.id})

    def get(self, request, *args, **kwargs):
        self.set_vintage_form(request)
        return super().get(request, *args, **kwargs)
    
    def post(self, request, *args, **kwargs):
        self.set_vintage_form(request)
        return super().post(request, *args, **kwargs)

    def test_func(self):
        # Only staff members can delete products
        return self.request.user.is_staff
    

class CustomerListView(LoginRequiredMixin, UserPassesTestMixin, ListView):
    '''View for listing all customers'''
    model = ReservedOrder
    template_name = 'shop/customers.html'
    
    def test_func(self):
        # Only staff members can view customers
        return self.request.user.is_staff
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        # get the search parameter "?=search"
        search = self.request.GET.get('search')
        if search:
            context['customers'] = Customer.objects.filter(Q(username__icontains=search) | Q(first_name__icontains=search) | Q(last_name__icontains=search))
        else:
            context['customers'] = Customer.objects.all()
        return context
    
class CustomerOrderView(CreateView):
    '''View for customers to place an order'''
    model = ReservedOrder
    form_class = CustomerOrderForm
    template_name = 'shop/customer_order.html'
    success_url = reverse_lazy('shop:products')
    
    def form_valid(self, form):
        form.instance.customer = self.request.user
        form = super().form_valid(form)
        return form
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['products'] = Product.objects.all().values('id', 'name')
        context['product'] = Product.objects.get(pk=self.kwargs['pk'])
        form = context['form']
        choices = form.fields['product']
        choices.queryset = ProductVintage.objects.filter(product_id=self.kwargs['pk'])
        choice = self.request.GET.get('vintage')
        if not choice:
            choice = choices.queryset[0].id
        vintage = ProductVintage.objects.get(pk=choice)
        context['price'] = vintage.price
        form.fields['product'].label = 'Vintage'
        form.fields['product'].initial = choice
        form.fields['quantity'].widget.attrs['max'] = vintage.available_stock
        form.fields['quantity'].widget.attrs['min'] = 1
        form.fields['quantity'].initial = 1
        return context

def vintage_availability(request, *args, **kwargs):
    '''function to request the availability of a vintage'''
    if request.method == 'GET':
        pk = kwargs['pk']
        if pk is None:
            return JsonResponse({'error': 'pk parameter is missing'}, status=400)
        availability = get_object_or_404(ProductVintage, pk=pk)
        return JsonResponse({'stock': availability.available_stock, 'price': availability.price})
    else:
        return JsonResponse({'error': 'GET request required'}, status=400)

class StaffOrderView(LoginRequiredMixin, UserPassesTestMixin, UpdateView):
    '''View for staff to update the state of an order'''
    model = ReservedOrder
    form_class = StaffOrderForm
    template_name = 'shop/order_update.html'
    success_url = reverse_lazy('shop:orders')

    def test_func(self):
        # Only staff members can update orders
        return self.request.user.is_staff
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['order'] = ReservedOrder.objects.get(pk=self.kwargs['pk'])
        context['form']['state'].initial = context['order'].state
        context['form'].fields['state'].choices = ORDER_CHOICES[:2]
        return context


class OrderListView(LoginRequiredMixin, UserPassesTestMixin, ListView):
    '''View for listing all orders'''
    model = ReservedOrder
    template_name = 'shop/order_list.html'
    
    def test_func(self):
        # Only staff members can view orders
        return self.request.user.is_staff
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['customers'] = Customer.objects.all().values('id', 'username', 'first_name', 'last_name')
        context['products'] = Product.objects.all().values('id', 'name')
        orders = ReservedOrder.objects.all()        
        dates = []
        for order in orders:
            date = order.ordered_at.date().strftime('%Y-%m-%d')
            if date not in dates:
                dates.append(date)
        context['dates'] = sorted(dates, reverse=True)
        prices = []
        for order in orders:
            if (order.product.price * order.quantity) not in prices:
                prices.append(order.product.price * order.quantity)
        context['prices'] = sorted(prices, reverse=True)
        state_filter = self.request.GET.get('state')
        query = Q()
        if state_filter:
            query.add(Q(state=state_filter), Q.AND)
        customer_filter = self.request.GET.get('customer')
        if customer_filter:
            query.add(Q(customer=customer_filter), Q.AND)
        product_filter = self.request.GET.get('product')
        if product_filter:
            query.add(Q(product__product=product_filter), Q.AND)
        date_filter = self.request.GET.get('date')
        if date_filter:
            date_filter = datetime.strptime(date_filter, '%Y-%m-%d')
            query.add(Q(ordered_at__date=date_filter), Q.AND)
        price_filter = self.request.GET.get('price')
        if price_filter:
            price_filter = float(price_filter)
            # Annotate each order with the calculated price (product__price * quantity)
            annotated_orders = ReservedOrder.objects.annotate(
                calculated_price=ExpressionWrapper(
                    F('product__price') * F('quantity'),
                    output_field=FloatField()
                )
            )
            orders = annotated_orders.filter(calculated_price=Value(price_filter))
            # Combine the price filter condition with other filter conditions
            query &= Q(id__in=orders.values('id'))
        context['orders'] = ReservedOrder.objects.filter(query)
        return context


class PurchasesListView(LoginRequiredMixin, UserPassesTestMixin, ListView):
    '''View for listing all orders'''
    model = Purchase
    template_name = 'shop/purchase_list.html'
    
    def test_func(self):
        # Only staff members can view orders
        return self.request.user.is_staff
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['form'] = StaffPurchaseForm()
        context['customers'] = Customer.objects.all().values('id', 'username', 'first_name', 'last_name')
        context['products'] = ProductVintage.objects.all()
        purchases = Purchase.objects.all()        
        dates = [purchase.purchased_at.date().strftime('%Y-%m-%d') for purchase in purchases]
        context['dates'] = sorted(dates, reverse=True)
        prices = []
        for purchase in purchases:
            if purchase.total_price not in prices:
                prices.append(purchase.total_price)
        context['prices'] = sorted(prices, reverse=True)
        state_filter = self.request.GET.get('state')
        query = Q()
        if state_filter:
            query.add(Q(state=state_filter), Q.AND)
        customer_filter = self.request.GET.get('customer')
        if customer_filter:
            query.add(Q(orders__customer=customer_filter), Q.AND)
        product_filter = self.request.GET.get('product')
        if product_filter:
            orders = ReservedOrder.objects.filter(product=product_filter).values('id')
            query.add(Q(orders__in=orders), Q.AND)
        date_filter = self.request.GET.get('date')
        if date_filter:
            date_filter = datetime.strptime(date_filter, '%Y-%m-%d')
            query.add(Q(purchased_at__date=date_filter), Q.AND)
        price_filter = self.request.GET.get('price')
        if price_filter:
            price_filter = query.add(Q(total_price=price_filter), Q.AND)
        context['purchases'] = Purchase.objects.filter(query)
        return context
    
class PurchaseUpdateStateView(LoginRequiredMixin, UserPassesTestMixin, UpdateView):
    '''View for staff to update the state of a purchase'''
    model = Purchase
    form_class = StaffPurchaseForm
    template_name = 'shop/purchase_update.html'
    success_url = reverse_lazy('shop:purchases')

    def add_quantity_to_stock(self, quantity, product_id):
        product_vintage = ProductVintage.objects.get(pk=product_id)
        product_vintage.stock += quantity
        product_vintage.save()

    def form_valid(self, form):
        valid = super().form_valid(form)
        if form.instance.state == 4:
            # Add the quantity back to the stock
            for order in form.instance.orders.all():
                self.add_quantity_to_stock(order.quantity, order.product.id)
        if self.request.GET.get('uncancel'):
            # A canceled purchase is being uncanceled
            for order in form.instance.orders.all():
                self.add_quantity_to_stock(order.quantity*-1, order.product.id)
        return valid

    def test_func(self):
        # Only staff members can update purchases
        return self.request.user.is_staff
  
class CartView(LoginRequiredMixin, ListView):
    '''View for listing all orders in the cart'''
    model = ReservedOrder
    template_name = 'shop/cart.html'

    def get_queryset(self):
        return ReservedOrder.objects.filter(customer=self.request.user)
    
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context["csrf_token"] = self.request.META['CSRF_COOKIE']
        context["purchases"] = Purchase.objects.filter(orders__customer=self.request.user).distinct()
        return context
    

def update_order(request, pk):
    '''View for customers to update their order'''
    try:
        order = get_object_or_404(ReservedOrder, pk=pk)
        if order.customer != request.user:
            return JsonResponse({'error': 'You are not authorized to update this order'}, status=403)
        data = json.loads(request.body)
        order.state = data.get('state', order.state)
        order.quantity = data.get('quantity', order.quantity)
        order.save()
        return JsonResponse({'success': True})
    except ReservedOrder.DoesNotExist:
        return JsonResponse({'success': False, 'error': 'Order does not exist'}, status=404)
    except Exception as e:
        return JsonResponse({'success': False, 'error': str(e)}, status=400)

def delete_customer_order(request, pk):
    order = get_object_or_404(ReservedOrder, id=pk)
    if not request.user.is_staff:
        if order.customer != request.user :
            return JsonResponse({'error': 'You are not authorized to delete this order'}, status=403)
        answer = redirect('shop:cart')
    else:
        answer = redirect('shop:orders')
    if request.method == 'POST':
        form = CustomerOrderDeleteForm(request.POST, instance=order)
        if form.is_valid():
            order.delete()
            return answer

def purchase_orders(request):
    '''View for customers to purchase their order'''
    print(request.body)
    if request.method == 'POST':
        data = json.loads(request.body)
        orders = data.get('orders', [])
        total_price = data.get('total_price', 0)
        for order in orders:
            reserved_order = get_object_or_404(ReservedOrder, pk=order)
            reserved_order.state = 2
            reserved_order.save()            
            # update the vintage-products' stock
            product_vintage = ProductVintage.objects.get(pk=reserved_order.product.id)
            product_vintage.stock -= reserved_order.quantity
            product_vintage.save()
        # Create a purchase transaction
        with transaction.atomic():
            # Create the Purchase record
            purchase = Purchase.objects.create(total_price=total_price)
            purchase.save()

            # Add the orders to the purchase
            purchase.orders.add(*orders)

        return JsonResponse({'success': True})
    else:
        return JsonResponse({'error': 'POST request required'}, status=400)
    

class PayView(LoginRequiredMixin, UpdateView):
    '''View for simulating payment of a purchase'''
    model = Purchase
    form_class = CustomerPaymentForm
    template_name = 'shop/payment.html'
    success_url = reverse_lazy('shop:cart')
    
    def get_context_data(self, **kwargs):
        if not self.request.user.is_authenticated:
            return redirect('accounts:login')
        context = super().get_context_data(**kwargs)
        context['purchase'] = Purchase.objects.get(pk=self.kwargs['pk'])
        if not self.request.user == context['purchase'].orders.first().customer:
            return HttpResponse('You are not authorized to view this page', status=403)
        context['form']['state'].initial = context['purchase'].state
        # only allow to change the state to 'paid'
        context['form'].fields['state'].choices = STATE_CHOICES[:2]
        
        return context