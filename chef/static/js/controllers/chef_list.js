/**
 * Created by nealshultz on 3/13/14.
 */
/**
 * Created by nealshultz on 3/12/14.
 */

/* create submitForm funciton */


function ChefListCtrl($scope, $http) {
    $http.get('/api/v1/chef/?format=json').
        success(function(chefs) {
            $scope.chefs = chefs.objects;
        });

    $scope.currentChef = null;

    $scope.setCurrentChef = function(email){
     //with map key value
        for(i=0; i < $scope.chefs.length; i++)
        {
            if($scope.chefs[i].email == email ){
                $scope.currentChef = $scope.chefs[i];


                $scope.appointment.chef = $scope.currentChef.resource_uri;
            }


        }
    };

//    $scope.chefURL = "views/partials/chef_detail.html";
}/**
 * Created by nealshultz on 3/13/14.
 */
