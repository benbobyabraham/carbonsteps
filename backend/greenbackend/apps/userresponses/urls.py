from django.urls import path
from . import views

urlpatterns = [
    path('', views.UserResponseListCreateAPIView.as_view(), name='user_responses_list'),
    path('<int:pk>/', views.UserResponseRetrieveUpdateDestroyAPIView.as_view(), name='user_responses_detail'),
]