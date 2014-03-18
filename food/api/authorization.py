from tastypie.authorization import Authorization
from tastypie.exceptions import Unauthorized

__author__ = 'nealshultz'

class CustomerObjectsOnlyAuthorization(Authorization):
    def read_list(self, object_list, bundle):
        return object_list.filter(customer=bundle.request.user.customer)

    def read_detail(self, object_list, bundle):
        return bundle.obj.customer == bundle.request.user.customer

    def create_list(self, object_list, bundle):
        return object_list

    def create_detail(self, object_list, bundle):
        bundle.obj.customer = bundle.request.user.customer
        return True

    def update_list(self, object_list, bundle):
        allowed = []

        # Since they may not all be saved, iterate over them.
        for obj in object_list:
            if obj.customer == bundle.request.user.customer:
                allowed.append(obj)

        return allowed

    def update_detail(self, object_list, bundle):
        return bundle.obj.customer == bundle.request.user.customer

    def delete_list(self, object_list, bundle):
        raise Unauthorized("Sorry, no deletes.")

    def delete_detail(self, object_list, bundle):
        raise Unauthorized("Sorry, no deletes.")