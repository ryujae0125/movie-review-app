(function() {
  'use strict';

  angular.module("app").controller("favoriteCtrl", function($scope, $http, $timeout) {
    $scope.setup = function() {
      $http.get("/api/v1/favorite_movies.json").then(function(response) {
        $scope.favorite_movies = response.data.map(function(movie){
          movie.favorite = 1;
          return movie;
        });
      });
    };

    $scope.toggleOrder = function(orderAttribute) {
      if (orderAttribute != $scope.orderAttribute) {
        $scope.isReverse = false;
        console.log($scope.orderAttribute);
      } else {
        $scope.isReverse = !$scope.isReverse;
      }
      $scope.orderAttribute = 'orderAttribute';
    };

    $scope.favorite = function(favorite_movie) {
      favorite_movie.favorite = favorite_movie.favorite ? 0 : 1;
      var favoritemovieParams = {
        movie_id: favorite_movie.movie_id,
        favorite: favorite_movie.favorite
      };
      $http.post('/api/v1/favorite_movies.json', favoritemovieParams).then(function(response) {
        favorite_movie.favoriteMessage = response.data.success;
      });
      $timeout(function() {
        favorite_movie.favoriteMessage = null;
      }, 1500);
    };
  });
})();
