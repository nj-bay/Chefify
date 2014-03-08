from django.db import models
from ChefifyUser import ChefifyUser


class Chef(ChefifyUser):
    price_minimum = models.PositiveIntegerField()
    price_maximum = models.PositiveIntegerField()
    has_equipment = models.BooleanField()
    equipment_charge = models.PositiveIntegerField()
    travel_radius = models.PositiveIntegerField()

    class Meta:
        app_label = 'food'
