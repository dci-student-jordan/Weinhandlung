# Generated by Django 5.0.6 on 2024-05-14 08:38

import django.db.models.deletion
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('shop', '0005_remove_product_price_remove_product_stock_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='reservedorder',
            name='product',
            field=models.ForeignKey(default=None, null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='vintages', to='shop.productvintage'),
        ),
    ]
