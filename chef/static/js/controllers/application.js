/**
 * Created by nealshultz on 3/20/14.
 */

function IndexCtrl($scope, $http) {
    $http.get('/api/v1/chef/?format=json').
        success(function(chefs) {
            $scope.chefs = chefs.objects;
        });
}



function AddLocationCtrl($scope, $http, $location) {
    $scope.submitForm = function() {
        $http.post('/api/v1/location/?format=json', $scope.location).
            success(function(response){
                $location.path("/");
            });
    }

}

/* create submitForm function */


function ChefListCtrl($scope, $http, $location) {
    $http.get('/api/v1/chef/?format=json').
        success(function(chefs) {
            $scope.chefs = chefs.objects;
        });

    $scope.currentChef = null;

    $scope.appointment = {};

    $scope.setCurrentChef = function(email){
     //with map key value
        for(i=0; i < $scope.chefs.length; i++)
        {
            if($scope.chefs[i].chefify_user.email == email ){
                $scope.currentChef = $scope.chefs[i];


                $scope.appointment.chef = $scope.currentChef.resource_uri;
            }


        }
    };

     $scope.submitForm = function() {
        $http.post('/api/v1/appointments/?format=json', $scope.appointment).
            success(function(response){
                $location.path("/");
            })
    }

     $http.get('/api/v1/event_type/?format=json').
        success(function(event_types){
            $scope.event_types = event_types.objects;
        });

//    $scope.chefURL = "views/partials/chef_detail.html";
}

/**
 * Created by nealshultz on 3/20/14.
 */

function MyAccountCtrl($scope, $http, $routeParams) {

    $http.get('/api/v1/chefify_user/'+ $routeParams.user_id + '/?format=json').
        success(function(user) {
            $scope.user = user;
        });


    $http.get('/api/v1/appointments/?format=json').
        success(function(appointments) {
            $scope.appointments = appointments.objects;

        });

    $scope.choices = [{ option : "CO", name : "Completed"}, { option : "AC", name : "Accepted"}, { option : "PE", name : "Pending"}, { option : "DE", name : "Declined"}];
    $scope.choice = $scope.choices[0];



}
