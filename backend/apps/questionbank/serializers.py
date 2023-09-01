from .models import Question, Choice
from rest_framework import serializers


class ChoiceSerializer(serializers.ModelSerializer):
    class Meta:
        model = Choice
        fields = ('id','choice_text','next_ques_map')

class QuestionSerializer(serializers.ModelSerializer):
    choices = ChoiceSerializer(source='choice_set',many=True, read_only=True)
    
    class Meta:
        model = Question
        fields = ('id','ordinal','question_text','choices','pub_date')


