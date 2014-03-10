from django.contrib import admin

# Register your models here.
from food.models import Chef, Menu, Dish, DishType, Cuisine

admin.site.register(Chef)
admin.site.register(Menu)
admin.site.register(Dish)
admin.site.register(DishType)
admin.site.register(Cuisine)