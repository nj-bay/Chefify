
function IndexCtrl($scope, $http) {
    $http.get('/api/v1/chef/?format=json').
        success(function(chefs) {
            $scope.chefs = chefs.objects;
        });
}
