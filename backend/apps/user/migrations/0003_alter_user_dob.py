# Generated by Django 4.2.4 on 2023-08-08 08:47

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('user', '0002_user_dob_user_gender_user_is_admin_user_phone'),
    ]

    operations = [
        migrations.AlterField(
            model_name='user',
            name='dob',
            field=models.DateField(verbose_name='Date of Birth'),
        ),
    ]