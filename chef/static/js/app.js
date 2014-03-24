/**
 * Created by nealshultz on 3/13/14.
 */
/**
 * Created by nealshultz on 3/12/14.
 */
var chef = angular.module('chef', ['ngRoute', 'ngAnimate',  'mgcrea.ngStrap', 'mgcrea.ngStrap.modal']);

chef.run(function ($http) {
    $http.defaults.headers.post['X-CSRFToken'] = csrftoken;
    $http.defaults.headers.put['X-CSRFToken'] = csrftoken;
    $http.defaults.headers.patch['X-CSRFToken'] = csrftoken;
    $http.defaults.headers.common['X-CSRFToken'] = csrftoken;
})

chef.config(['$routeProvider', function($routeProvider) {
    $routeProvider.
        when('/', {templateUrl: '/static/views/index.html', controller: IndexCtrl}).
        when('/chef_list', {templateUrl: '/static/views/chef_list.html', controller: ChefListCtrl}).
        when('/add_location', {templateUrl: '/static/views/add_location.html', controller: AddLocationCtrl}).
        when('/my_account/:user_id', {templateUrl: '/static/views/my_account.html', controller: MyAccountCtrl}).
        otherwise({redirectTo: '/'});
}]);