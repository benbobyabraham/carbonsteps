# Generated by Django 4.2.4 on 2023-08-21 11:42

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('questionbank', '0004_choice_question_delete_questionbank_choice_question'),
    ]

    operations = [
        migrations.AddField(
            model_name='question',
            name='correct_choice',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, related_name='correct_choice_or_question', to='questionbank.choice'),
        ),
    ]
