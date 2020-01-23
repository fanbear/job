# Generated by Django 2.2.1 on 2019-05-23 09:27

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('home', '0036_auto_20190523_1208'),
    ]

    operations = [
        migrations.CreateModel(
            name='ReviewsItem',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('img', models.ImageField(upload_to='images/home/ReviewsBlock/%Y', verbose_name='Фото клиента')),
                ('fln', models.CharField(max_length=800, verbose_name='ФИО клиента')),
                ('position', models.CharField(max_length=2000, verbose_name='Должность клиента')),
                ('review', models.TextField(blank=True, verbose_name='Отзыв клиента')),
                ('awesome', models.CharField(max_length=200, verbose_name='Иконка fa-facebook-f')),
                ('button_name', models.CharField(max_length=800, verbose_name='Название кнопки')),
                ('button_url', models.CharField(max_length=2000, verbose_name='Ссылка кнопки')),
            ],
            options={
                'verbose_name': 'Пятый блок - Отзывы (Отзыв клиента)',
                'verbose_name_plural': 'Пятый блок - Отзывы (Отзыв клиента)',
            },
        ),
    ]
