/**
 * Created by nealshultz on 3/13/14.
 */
/**
 * Created by nealshultz on 3/12/14.
 */
var chef = angular.module('chef', ['ngRoute']);

chef.config(['$routeProvider', function($routeProvider) {
    $routeProvider.
        when('/', {templateUrl: '/static/views/index.html', controller: IndexCtrl}).
        when('/chef_list', {templateUrl: '/static/views/chef_list.html', controller: ChefListCtrl}).
        otherwise({redirectTo: '/'});
}]);