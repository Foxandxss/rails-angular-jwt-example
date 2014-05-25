angular.module('app')
  .controller('LoginController', function($scope, $state, Auth) {
    $scope.errors = [];

    $scope.login = function() {
      if ($scope.loginForm.$valid) {
        $scope.errors = [];
        Auth.login($scope.user).success(function(result) {
          console.log("ok");
          $state.go('user.messages');
        }).error(function(err) {
          console.log("error");
          $scope.errors.push(err);
        });
      }
    };
  });