# Generated by Django 2.2.1 on 2019-05-21 08:53

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('home', '0007_phone'),
    ]

    operations = [
        migrations.CreateModel(
            name='db_footer_desc',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('description', models.TextField(blank=True)),
                ('facebook_url', models.CharField(max_length=1000)),
                ('instagram_url', models.CharField(max_length=1000)),
                ('youtube_url', models.CharField(max_length=1000)),
            ],
        ),
        migrations.AlterField(
            model_name='metatag',
            name='description',
            field=models.TextField(blank=True, db_index=True),
        ),
    ]
