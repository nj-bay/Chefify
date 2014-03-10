from django.db import models
from Cuisine import Cuisine
from Dish import Dish

__author__ = 'nealshultz'


class Menu(models.Model):
    # chef_id = models.ForeignKey('Chef', related_name='menus')
    cuisine = models.ForeignKey(Cuisine)
    dishes = models.ManyToManyField(Dish)
    class Meta:
        app_label = 'food'

    def __unicode__(self):
        return "{0} {1}".format(self.cuisine, self.dishes)