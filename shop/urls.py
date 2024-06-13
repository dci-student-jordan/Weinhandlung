from django.urls import path
from .views import *
from django.views.generic import TemplateView

app_name = 'shop'

urlpatterns = [
    path('', index, name='home'),
    path('about/', TemplateView.as_view(template_name='shop/about.html'), name='about'),
    path('products/', ProductListView.as_view(), name='products'),
    path('vintages/', ProductVintageListView.as_view(), name='vintages_list'),
    path('vintages/<int:pk>/', ProductVintageListView.as_view(), name='vintages'), # pk = product id
    path('products/<int:pk>/', ProductDetailView.as_view(), name='product_detail'),
    path('productvintage/<int:pk>/', ProductVintageDetailView.as_view(), name='vintage_detail'), # pk = vintage id
    path('products/update/<int:pk>/', ProductUpdateView.as_view(), name='product_update'),
    path('productvintages/update/<int:pk>/', ProductUpdateView.as_view(), name='vintage_update'),
    path('products/create/', ProductCreateView.as_view(), name='product_create'),
    path('productvintages/create/', ProductCreateView.as_view(), name='vintage_create'),
    path('products/delete/<int:pk>/', ProductDeleteView.as_view(), name='product_delete'),
    path('productvintages/delete/<int:pk>/', ProductDeleteView.as_view(), name='vintage_delete'),
    path('products/order/<int:pk>/', CustomerOrderView.as_view(), name='customer_order'),
    path('products/order/availability/<int:pk>/', vintage_availability, name='vintage_availability'),
    path('customers/', CustomerListView.as_view(), name='customers'),
    path('orders/', OrderListView.as_view(), name='orders'),
    path('purchases/', PurchasesListView.as_view(), name='purchases'),
    path('customer/orders/update/<int:pk>/', update_order, name='update_customer_order'),
    path('customer/orders/purchase/', purchase_orders, name='purchase_customer_orders'),
    path('customer/purchase/payment/<int:pk>', PayView.as_view(), name='payment'),
    path('customer/orders/delete/<int:pk>/', delete_customer_order, name='customer_delete_order'),
    path('orders/update/<int:pk>/', StaffOrderView.as_view(), name='update_order'),
    path('purchases/update/<int:pk>/', PurchaseUpdateStateView.as_view(), name='update_purchase'),
    path('cart/', CartView.as_view(), name='cart'),
]