# Generated by Django 2.2.1 on 2019-05-21 13:35

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('home', '0015_workblock'),
    ]

    operations = [
        migrations.CreateModel(
            name='WorkList',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('strong', models.CharField(max_length=80)),
                ('lists', models.CharField(max_length=200)),
            ],
        ),
        migrations.RemoveField(
            model_name='workblock',
            name='lists',
        ),
        migrations.RemoveField(
            model_name='workblock',
            name='strong',
        ),
    ]
