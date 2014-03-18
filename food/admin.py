from django.contrib import admin
from food.models import Chef, Menu, Dish, DishType, Cuisine, EventType, Location, ChefifyUser, Customer, Appointments

admin.site.register(ChefifyUser)
admin.site.register(Chef)
admin.site.register(Menu)
admin.site.register(Dish)
admin.site.register(DishType)
admin.site.register(Cuisine)
admin.site.register(EventType)
admin.site.register(Location)
admin.site.register(Customer)
admin.site.register(Appointments)