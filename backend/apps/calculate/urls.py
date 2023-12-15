from django.urls import path
from . import views

urlpatterns = [
    path('', views.FootprintCalc.as_view(), name='footprint-calc'),
]