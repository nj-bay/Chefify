from django.db import models
from Menu import Menu
from django.contrib.auth.models import User



class ChefifyUser(User):
    """ basic App Class to Inherit From
    """
    menu = models.ForeignKey(Menu, null=True)
    class Meta:
        abstract = True

