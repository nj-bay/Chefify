from decimal import Decimal
from django.contrib.auth.models import AbstractUser, UserManager, User
from django.db import models
from django.db.models.signals import post_save

class Cuisine(models.Model):
    type = models.CharField(max_length=100)

    def __unicode__(self):
        return self.type


class DishType(models.Model):
    name = models.CharField(max_length=100)

    def __unicode__(self):
        return self.name


class Dish(models.Model):
    name = models.CharField(max_length=100)
    type = models.ForeignKey(DishType)
    cuisine = models.ForeignKey(Cuisine)

    def __unicode__(self):
        return u"{0}, {1}, {2}".format(self.name, self.type, self.cuisine)


class Menu(models.Model):
    cuisine = models.ForeignKey(Cuisine)
    dishes = models.ManyToManyField(Dish)

    def __unicode__(self):
        dishes = ""
        for dish in self.dishes.all():
            dishes += dish.name + " "

        return "{0} - {1}".format(self.cuisine, dishes)


class ChefifyUser(AbstractUser):
    """ basic App Class to Inherit From
    """
    menu = models.ForeignKey(Menu, null=True, blank=True)

    is_chef = models.BooleanField(default=False)

    objects = UserManager()

    def get_absolute_url(self):
        return "/app"


class Chef(models.Model):
    chefify_user = models.OneToOneField(ChefifyUser)

    price_minimum = models.DecimalField(max_digits=8, decimal_places=2, default=Decimal(0.00),null=True)
    price_maximum = models.DecimalField(max_digits=8, decimal_places=2, default=Decimal(0.00),null=True)
    has_equipment = models.BooleanField()
    equipment_charge = models.PositiveIntegerField()
    travel_radius = models.PositiveIntegerField()
    restaurant = models.CharField(max_length=100, null=True)
    cuisine = models.ManyToManyField(Cuisine, null=True, related_name='chefs')
    def __unicode__(self):
        return self.chefify_user.username


class Customer(models.Model):
    chefify_user = models.OneToOneField(ChefifyUser)

    def __unicode__(self):
        return self.chefify_user.username


def create_profile(sender, **kw):
    user = kw["instance"]
    if kw["created"]:
        profile = Customer(chefify_user=user)
        profile.save()

post_save.connect(create_profile, sender=ChefifyUser, dispatch_uid="users-profilecreation-signal")


class EventType(models.Model):
    type = models.CharField(max_length=100)

    def __unicode__(self):
        return self.type


class Location(models.Model):
    address = models.CharField(max_length=100)
    city = models.CharField(max_length=100)
    state = models.CharField(max_length=100)
    zip_code = models.CharField(max_length=100)
    latitude = longitude = models.DecimalField(max_digits=9, decimal_places=6, null=True)
    longitude = models.DecimalField(max_digits=9, decimal_places=6, null=True)

    def __unicode__(self):
        return "{0} {1}, {2} {3}".format(self.address, self.city, self.state, self.zip_code)

class Appointments(models.Model):
    chef = models.ForeignKey(Chef, null=True)
    customer = models.ForeignKey(Customer)
    ratings = models.PositiveIntegerField(null=True, blank=True)
    start_time = models.DateTimeField()
    end_time = models.DateTimeField()
    number_of_guests = models.PositiveSmallIntegerField()
    event_type = models.ForeignKey(EventType)
    has_menu = models.BooleanField()
    menu = models.ForeignKey(Menu, null=True, blank=True)
    location = models.ForeignKey(Location, null=True, blank=True)
    COMPLETED = 'CO'
    ACCEPTED = 'AC'
    PENDING = 'PE'
    DECLINED = 'DE'
    status_choices = (
        (COMPLETED, 'Completed'),
        (ACCEPTED, 'Accepted'),
        (PENDING, 'Pending'),
        (DECLINED, 'Declined'),
    )
    status = models.CharField(max_length=2,
                                 choices=status_choices,
                                 default=PENDING
                                 )

    def __unicode__(self):
        return "{0}: {1}".format(self.customer, self.event_type)



