# Generated by Django 4.1 on 2022-08-11 06:10

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('core', '0002_rename_eeservation_colleges_reservation'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='colleges',
            options={'verbose_name': 'College', 'verbose_name_plural': 'Colleges'},
        ),
        migrations.AlterModelOptions(
            name='teachers',
            options={'verbose_name': 'Teacher', 'verbose_name_plural': 'Teachers'},
        ),
        migrations.AddField(
            model_name='colleges',
            name='no_of_seat',
            field=models.IntegerField(default=0),
        ),
        migrations.AlterField(
            model_name='colleges',
            name='reservation',
            field=models.ForeignKey(db_column='reservation_id', on_delete=django.db.models.deletion.CASCADE, to='core.reservation'),
        ),
    ]
