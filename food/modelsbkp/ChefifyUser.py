from django.db import models
from django.db.models.signals import post_save
from Menu import Menu
from django.contrib.auth.models import AbstractUser
from food.models import Customer


class ChefifyUser(AbstractUser):
    """ basic App Class to Inherit From
    """
    menu = models.ForeignKey(Menu, null=True, blank=True)

    class Meta:
        app_label="food"


def create_profile(sender, **kw):
    user = kw["instance"]
    if kw["created"]:
        profile = Customer(chefify_user=user)
        profile.save()

post_save.connect(create_profile, sender=ChefifyUser, dispatch_uid="users-profilecreation-signal")