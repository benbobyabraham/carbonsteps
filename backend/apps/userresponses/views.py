from rest_framework import generics
from .models import UserResponse
from ..user.mixins import CustomLoginRequiredMixin
from .serializers import UserResponseSerializer

class UserResponseListCreateAPIView(CustomLoginRequiredMixin, generics.ListCreateAPIView):
    queryset = UserResponse.objects.all()
    serializer_class = UserResponseSerializer

class UserResponseRetrieveUpdateDestroyAPIView(CustomLoginRequiredMixin, generics.RetrieveUpdateDestroyAPIView):
    queryset = UserResponse.objects.all()
    serializer_class = UserResponseSerializer