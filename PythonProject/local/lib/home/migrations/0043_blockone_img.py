# Generated by Django 2.2.1 on 2019-05-23 15:55

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('home', '0042_advanblock_advanitem'),
    ]

    operations = [
        migrations.AddField(
            model_name='blockone',
            name='img',
            field=models.ImageField(default=0, upload_to='images/home/blockOne/%Y', verbose_name='Задний фон блока'),
            preserve_default=False,
        ),
    ]
