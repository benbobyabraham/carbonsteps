from django.db import models
from ..user.models import User
from ..questionbank.models import Question

class UserResponse(models.Model):
    user = models.ForeignKey(
        User, on_delete=models.CASCADE
        )
    
    # question = models.ForeignKey(
    # Question, on_delete=models.CASCADE
    # )

    response = models.TextField()

    created_at = models.DateTimeField(
        'Created Datetime', blank=True, auto_now_add=True
    )

    def __str__(self):
        
        return f"{self.user.email} - {self.created_at.hour}:{self.created_at.minute}:{self.created_at.second} \
                    {self.created_at.day}/{self.created_at.month}/{self.created_at.year}"