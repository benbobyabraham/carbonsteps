from django.contrib import admin
from .models import User

@admin.register(User)
class User(admin.ModelAdmin):
    fields = ['username','email','phone','gender','dob','is_admin','token','token_expires_at']
    list_filter = []
    list_display = []
