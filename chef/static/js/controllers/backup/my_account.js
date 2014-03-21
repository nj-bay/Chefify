/**
 * Created by nealshultz on 3/20/14.
 */

function MyAccountCtrl($scope, $http, $chef_id) {
    $http.get('/api/v1/chef/2/?format=json').
        success(function(chefs) {
            $scope.chefs = chefs.objects;
        });
}
