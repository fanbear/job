# Generated by Django 2.2.1 on 2019-05-23 13:31

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('home', '0041_reviewsblock_btn_url'),
    ]

    operations = [
        migrations.CreateModel(
            name='advanBlock',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=800, verbose_name='Заголовок блока')),
                ('desc', models.TextField(blank=True, verbose_name='Описание блока')),
            ],
            options={
                'verbose_name': 'Шестой блок - Преимущества (Заголовок, Описание)',
                'verbose_name_plural': 'Шестой блок - Преимущества (Заголовок, Описание)',
            },
        ),
        migrations.CreateModel(
            name='advanItem',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=300, verbose_name='Название элемента')),
                ('img', models.ImageField(upload_to='images/home/advanBlock/%Y', verbose_name='Картинка элемента')),
                ('title', models.CharField(max_length=800, verbose_name='Заголовок элемента')),
                ('desc', models.TextField(blank=True, verbose_name='Описание элемента')),
                ('int_circl', models.IntegerField(default=100, verbose_name='Число круга')),
                ('name_circl', models.CharField(max_length=800, verbose_name='Название круга')),
                ('bar', models.IntegerField(default=0, verbose_name='Прогрессбар')),
            ],
            options={
                'verbose_name': 'Шестой блок - Элементы блока)',
                'verbose_name_plural': 'Шестой блок - Элементы блока',
            },
        ),
    ]
