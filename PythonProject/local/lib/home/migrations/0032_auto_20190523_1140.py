# Generated by Django 2.2.1 on 2019-05-23 08:40

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('home', '0031_auto_20190522_1720'),
    ]

    operations = [
        migrations.CreateModel(
            name='ReviewsBlock',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=800, verbose_name='Заголовок блока')),
                ('desc', models.TextField(blank=True, verbose_name='Описание блока')),
                ('desc_width', models.IntegerField(default=100, verbose_name='Размер описания в %')),
                ('img_bg', models.ImageField(upload_to='images/home/ReviewsBlock/%Y', verbose_name='Задний фон блока')),
            ],
        ),
        migrations.AlterField(
            model_name='portfolioblock',
            name='desc_width',
            field=models.IntegerField(default=100, verbose_name='Размер описания в %'),
        ),
    ]
