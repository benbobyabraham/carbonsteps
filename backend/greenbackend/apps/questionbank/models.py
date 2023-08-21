from django.db import models

class Question(models.Model):
    class Meta(object):
        db_table = "question"

    question_text = models.CharField(
        'Question', max_length=200, blank=False, null=False
    )

    pub_date = models.DateTimeField(
        'Date Published', blank=True, auto_now_add=True
    )

    correct_choice = models.ForeignKey(
        'Choice', on_delete=models.SET_NULL, null=True, blank=True, related_name='correct_choice_or_question'
    )

    def __str__(self):
        return self.question_text

class Choice(models.Model):
    class Meta(object):
        db_table = "choice"
    
    question = models.ForeignKey(
        Question, on_delete=models.CASCADE, related_name='choice_set'
    )

    choice_text = models.CharField(
        "Choice Text", max_length=200
    )

    def __str__(self):
        return self.choice_text