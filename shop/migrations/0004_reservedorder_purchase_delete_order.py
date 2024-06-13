# Generated by Django 5.0.6 on 2024-05-14 07:24

import django.db.models.deletion
from django.conf import settings
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('shop', '0003_rename_products_order_product'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='ReservedOrder',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('quantity', models.PositiveIntegerField()),
                ('ordered_at', models.DateTimeField(auto_now_add=True)),
                ('state', models.IntegerField(blank=True, choices=[(0, 'Pending'), (1, 'Purchased')], default=0, null=True)),
                ('customer', models.ForeignKey(default=None, null=True, on_delete=django.db.models.deletion.SET_NULL, to=settings.AUTH_USER_MODEL)),
                ('product', models.ForeignKey(default=None, null=True, on_delete=django.db.models.deletion.SET_NULL, to='shop.product')),
            ],
        ),
        migrations.CreateModel(
            name='Purchase',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('total_price', models.DecimalField(decimal_places=2, default=0.0, max_digits=6)),
                ('purchased_at', models.DateTimeField(auto_now_add=True)),
                ('state', models.IntegerField(blank=True, choices=[(0, 'Pending'), (1, 'Payed'), (2, 'Shipped'), (3, 'Delivered'), (4, 'Canceled')], default=0, null=True)),
                ('orders', models.ManyToManyField(to='shop.reservedorder')),
            ],
        ),
        migrations.DeleteModel(
            name='Order',
        ),
    ]