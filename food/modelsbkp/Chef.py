from decimal import Decimal
from django.db import models
from ChefifyUser import ChefifyUser


class Chef(models.Model):
    chefify_user = models.OneToOneField('food.ChefifyUser')

    price_minimum = models.DecimalField(max_digits=8, decimal_places=2, default=Decimal(0.00),null=True)
    price_maximum = models.DecimalField(max_digits=8, decimal_places=2, default=Decimal(0.00),null=True)
    has_equipment = models.BooleanField()
    equipment_charge = models.PositiveIntegerField()
    travel_radius = models.PositiveIntegerField()

    class Meta:
        app_label = 'food'

    def __unicode__(self):
        return self.chefify_user.username