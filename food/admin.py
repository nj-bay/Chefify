from django.contrib import admin

# Register your models here.
from food.models import Chef
from food.models import Menu
admin.site.register(Chef)
admin.site.register(Menu)