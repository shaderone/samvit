# Generated by Django 4.1 on 2022-08-17 18:34

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0003_alter_colleges_options_alter_teachers_options_and_more'),
    ]

    operations = [
        migrations.CreateModel(
            name='Test',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=255)),
                ('phone', models.CharField(max_length=12)),
                ('passw', models.CharField(max_length=255)),
            ],
        ),
    ]
