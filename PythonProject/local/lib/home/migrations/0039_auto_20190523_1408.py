# Generated by Django 2.2.1 on 2019-05-23 11:08

import colorful.fields
from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('home', '0038_auto_20190523_1252'),
    ]

    operations = [
        migrations.AlterField(
            model_name='portfolioimg',
            name='item_color',
            field=colorful.fields.RGBColorField(default='#fff', verbose_name='Цвет подложки'),
        ),
    ]
