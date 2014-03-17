from django.contrib import admin

# Register your models here.
from food.models import Chef, Menu, Dish, DishType, Cuisine, EventType, Location

admin.site.register(Chef)
admin.site.register(Menu)
admin.site.register(Dish)
admin.site.register(DishType)
admin.site.register(Cuisine)
admin.site.register(EventType)
admin.site.register(Location)