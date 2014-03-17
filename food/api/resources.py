from django.conf import settings
from tastypie.authorization import Authorization
from tastypie.bundle import Bundle
from tastypie.constants import ALL_WITH_RELATIONS, ALL
from tastypie.fields import ToManyField, CharField, ToOneField
from tastypie.resources import ModelResource, Resource
from food.models import Chef, Menu, Cuisine, DishType, Dish, Appointments, EventType, Location


class DishTypeResource(ModelResource):
    class Meta:
        queryset = DishType.objects.all()
        resource_name = 'dish_type'
        filtering = {
            'name': ALL
        }


class CuisineResource(ModelResource):
    class Meta:
        queryset = Cuisine.objects.all()
        resource_name = 'cuisine'
        filtering = {
            'type': ALL
        }

class DishResource(ModelResource):
    type = ToOneField(DishTypeResource, 'type', full=True)
    cuisine = ToOneField(CuisineResource, 'cuisine',  full=True)
    class Meta:
        queryset = Dish.objects.all()
        resource_name = 'dish'
        filtering = {
            'name': ALL,
            'type': ALL_WITH_RELATIONS,
            'cuisine': ALL_WITH_RELATIONS
        }


class MenuResource(ModelResource):
    cuisine = ToOneField(CuisineResource, 'cuisine', full=True)
    dishes = ToManyField(DishResource, 'dishes', full=True)
    class Meta:
        queryset = Menu.objects.all()
        resource_name = 'menu'
        filtering = {
            'cuisine': ALL_WITH_RELATIONS,
            'dishes': ALL_WITH_RELATIONS
        }


class ChefResource(ModelResource):
    menu = ToOneField(MenuResource, 'menu', full=True)
    class Meta:
        queryset = Chef.objects.all()
        resource_name = 'chef'
        filtering = {
            'menu': ALL_WITH_RELATIONS,
            'price_minimum': ALL
        }

class EventTypeResource(ModelResource):
    class Meta:
        queryset = EventType.objects.all()
        resource_name = 'event_type'

class LocationResource(ModelResource):
    class Meta:
        queryset = Location.objects.all()
        resource_name = 'location'
        authorization = Authorization()


class AppointmentsResource(ModelResource):
    chef = ToOneField(ChefResource, 'chef', full=True)
    event_type = ToOneField(EventTypeResource, 'event_type', full=True)
    location = ToOneField(LocationResource, 'location', full=True)
    class Meta:
        queryset = Appointments.objects.all()
        resource_name = 'appointments'
