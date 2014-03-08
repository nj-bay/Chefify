from django.db import models
from ChefifyUser import ChefifyUser

__author__ = 'nealshultz'

class Customer(ChefifyUser):
     class Meta:
        app_label = 'food'


