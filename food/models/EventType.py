from django.db import models

__author__ = 'nealshultz'


class EventType(models.Model):
    type = models.CharField(max_length=100)
    class Meta:
        app_label = 'food'