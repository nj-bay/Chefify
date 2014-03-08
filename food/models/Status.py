from django.db import models

__author__ = 'nealshultz'

class Status(models.Model):
    description = models.CharField(max_length=20)
    class Meta:
        app_label = 'food'