# Generated by Django 2.2.1 on 2019-05-24 07:27

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('home', '0043_blockone_img'),
    ]

    operations = [
        migrations.CreateModel(
            name='TeamBlock',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('title', models.CharField(max_length=800, verbose_name='Заголовок блока')),
                ('desc', models.TextField(blank=True, verbose_name='Описание блока')),
                ('img', models.ImageField(upload_to='images/home/TeamBlock/%Y', verbose_name='Задний фон блока')),
                ('button_url', models.CharField(max_length=5000, verbose_name='Ссылка кнопки')),
            ],
            options={
                'verbose_name': 'Наша команда',
                'verbose_name_plural': 'Седьмой блок - Наша команда',
            },
        ),
        migrations.CreateModel(
            name='TeamItem',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('img', models.ImageField(upload_to='image/home/TeamBlock/%Y/people')),
                ('name', models.CharField(max_length=800, verbose_name='Имя')),
                ('position', models.CharField(max_length=2000, verbose_name='Должность')),
                ('social_inst', models.CharField(max_length=500, verbose_name='Ссылка instagram')),
                ('social_face', models.CharField(max_length=2000, verbose_name='Ссылка на facebook')),
            ],
            options={
                'verbose_name': 'Наша команда - элементы',
                'verbose_name_plural': 'Седьмой блок - Элементы команды',
            },
        ),
    ]
