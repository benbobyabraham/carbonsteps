from django.db import models

class User(models.Model):
    class Meta(object):
        db_table = "user"

    GENDER_CHOICES = [
        ('M', 'Male'),
        ('F', 'Female'),
        ('O', 'Other'),
    ]

    username = models.CharField(
        'Username', blank=False, null=False, max_length=50, db_index=True
    )
    
    password = models.CharField(
        'Password', blank=False, null=False, max_length=500, db_index=True
    )

    email = models.EmailField(
        'Email', blank=False, null=False, max_length=254, db_index=True
    )

    phone = models.CharField(
        'Phone Number',blank=False,null=False, max_length=15,db_index=True
    )

    gender = models.CharField(
        'Gender', max_length=1, choices=GENDER_CHOICES, blank=False,null=False
    )

    dob = models.DateField(
        'Date of Birth',blank=False,null=False
    )

    is_admin = models.BooleanField(
        'IsAdmin',default=False
    )

    token = models.CharField(
        'Token', blank=True, null=True, max_length=500, db_index=True
    )

    token_expires_at = models.DateTimeField(
        "Token Expiry", blank=True, null=True
    )

    created_at = models.DateTimeField(
        'Created Datetime', blank=True, auto_now_add=True
    )

    modified_at = models.DateTimeField(
        'Updated Datetime', blank=True, auto_now=True
    )
