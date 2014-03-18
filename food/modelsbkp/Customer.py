from django.db import models

__author__ = 'nealshultz'

class Customer(models.Model):
    chefify_user = models.OneToOneField('food.ChefifyUser')

    class Meta:
        app_label = 'food'

    def __unicode__(self):
        return self.chefify_user.username