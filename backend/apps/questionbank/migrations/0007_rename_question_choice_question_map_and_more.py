# Generated by Django 4.2.4 on 2023-08-23 16:36

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('questionbank', '0006_alter_choice_question'),
    ]

    operations = [
        migrations.RenameField(
            model_name='choice',
            old_name='question',
            new_name='question_map',
        ),
        migrations.RemoveField(
            model_name='question',
            name='correct_choice',
        ),
        migrations.AddField(
            model_name='question',
            name='ordinal',
            field=models.IntegerField(blank=True, null=True, verbose_name='Question Order'),
        ),
    ]
