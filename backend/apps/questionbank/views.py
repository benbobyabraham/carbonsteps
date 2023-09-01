from rest_framework import generics
from .serializers import QuestionSerializer
from ..user.mixins import CustomLoginRequiredMixin
from .models import Question


class QuestionList(CustomLoginRequiredMixin, generics.ListAPIView):
    queryset = Question.objects.prefetch_related('choice_set').order_by('id')
    serializer_class = QuestionSerializer