# Generated by Django 2.2.1 on 2019-05-23 11:44

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('home', '0039_auto_20190523_1408'),
    ]

    operations = [
        migrations.AddField(
            model_name='reviewsitem',
            name='awesome_url',
            field=models.CharField(default=0, max_length=2000, verbose_name='Сылка соц. сети'),
            preserve_default=False,
        ),
    ]
