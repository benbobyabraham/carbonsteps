# Generated by Django 4.2.4 on 2023-08-21 15:11

from django.db import migrations, models
import django.utils.timezone


class Migration(migrations.Migration):

    dependencies = [
        ('userresponses', '0002_remove_userresponse_question'),
    ]

    operations = [
        migrations.AddField(
            model_name='userresponse',
            name='created_at',
            field=models.DateTimeField(auto_now_add=True, default=django.utils.timezone.now, verbose_name='Created Datetime'),
            preserve_default=False,
        ),
    ]
