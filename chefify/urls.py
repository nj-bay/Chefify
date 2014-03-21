from django.conf.urls import patterns, include, url
from django.contrib import admin
import registration
from tastypie.api import Api
from food.api.resources import ChefResource, DishTypeResource, DishResource, CuisineResource, MenuResource, \
    AppointmentsResource, LocationResource, EventTypeResource, CustomerResource

from django.contrib import admin
admin.autodiscover()

v1_api = Api(api_name="v1")
v1_api.register(ChefResource())
v1_api.register(DishTypeResource())
v1_api.register(DishResource())
v1_api.register(CuisineResource())
v1_api.register(MenuResource())
v1_api.register(AppointmentsResource())
v1_api.register(LocationResource())
v1_api.register(EventTypeResource())
v1_api.register(CustomerResource())



urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'chefify.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),

    url(r'^app/', 'chef.views.angular', name='angular'),

    url(r'^api/', include(v1_api.urls)),

    url(r'^admin/', include(admin.site.urls)),

    url(r'^accounts/', include('registration.backends.simple.urls')),

#     url(r'^index', 'food.views.index', name='angular'), for views in food
)
