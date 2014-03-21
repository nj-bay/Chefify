function AddLocationCtrl($scope, $http, $location) {
    $scope.submitForm = function() {
        $http.post('/api/v1/location/?format=json', $scope.location).
            success(function(response){
                $location.path("/");
            });
    }

}


