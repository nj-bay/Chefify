from django.db import models
from EventType import EventType
from Chef import Chef
from Customer import Customer
from Menu import Menu
from Status import Status
from Location import Location


class Appointments(models.Model):
    chef_id = models.ForeignKey(Chef)
    customer_id = models.ForeignKey(Customer)
    ratings = models.PositiveIntegerField(null=True)
    start_time = models.DateTimeField()
    end_time = models.DateTimeField()
    number_of_guests = models.PositiveSmallIntegerField()
    event_type = models.ForeignKey(EventType)
    has_menu = models.BooleanField()
    menu = models.ForeignKey(Menu)
    status = models.ForeignKey(Status)
    location = models.ForeignKey(Location)
    class Meta:
        app_label = 'food'
