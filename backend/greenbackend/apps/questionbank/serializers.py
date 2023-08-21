from .models import Question, Choice
from rest_framework import serializers


class ChoiceSerializer(serializers.ModelSerializer):
    class Meta:
        model = Choice
        fields = ('id','choice_text')

class QuestionSerializer(serializers.ModelSerializer):
    choices = ChoiceSerializer(source='choice_set',many=True, read_only=True)
    
    class Meta:
        model = Question
        fields = ('id','question_text','choices','pub_date','correct_choice')


