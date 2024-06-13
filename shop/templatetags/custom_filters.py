from django import template
from django.db.models.query import QuerySet

register = template.Library()

@register.filter
def state_filtered(orders, state=0):
    return [order for order in orders if order.state == state]

@register.filter
def sum_prices(orders):
    return sum((order.product.price * order.quantity) for order in orders)

@register.filter
def ids_only(orders):
    return [order.id for order in orders]

@register.filter
def unpayed(orders):
    purchases = []
    for order in [order for order in orders if order.state == 2]:
        purchase = order.purchase_set.first()
        if purchase.state < 1 and purchase not in purchases:
            purchases.append(purchase)
    return len(purchases)

@register.filter
def difference(value1, value2):
    return value1 - value2

@register.filter
def order_by(queryset, order):
    if isinstance(queryset, QuerySet):
        return queryset.order_by(order)
    return queryset

@register.filter
def product_counted(queryset):
    products = {}
    for order in queryset:
        name = str(order.product)
        if name not in products:
            products[name] = [1, [order.quantity]]
        else:
            products[name][0] += 1
            products[name][1].append(order.quantity)
    return products


@register.filter
def sum_list_1_0(value):
    return f'{sum([val[0] for val in value.values()])} ({sum([val[1][0] for val in value.values()])} amounts)'