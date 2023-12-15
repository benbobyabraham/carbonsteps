from django.db import models

class Lookup(models.Model):
    key = models.CharField(max_length=100)
    value = models.DecimalField(max_digits=16, decimal_places=8)

    def __str__(self):
        return self.key