(function() {
  "use strict";

  angular.module('app').controller('ratingsCtrl', function($scope, $http) {
    $http.get('/api/v1/reviews/user_reviews.json').then(function(response) {
      $scope.reviews = response.data;
      fillStars();
    });

    $scope.favoriteReview = function(review, star) {
      console.log(star);
      var favoriteParams = {
        review_id: review.id,
        rating: star.rating,
        movie_id: review.movie_id
      };
      $http.post("/api/v1/reviews/"+review.id+".json", favoriteParams).success(function(response) {
        review.rating = response.rating;
        fillStars();
      });
    };

    function fillStars() {
      $scope.reviews.forEach(function(review) {
        review.stars.forEach(function(star) {
          star.filled = review.rating >= star.rating;
        });
      });
    }

    $scope.emptyStar = function(review, star) {
      review.stars.forEach(function(s) {
        if (s.rating > review.rating) {
          s.filled = false;
        }
      });
    };

    $scope.fillStar = function(review, star) {
      review.stars.forEach(function(s) {
        if (s.rating <= star.rating) {
          s.filled = true;
        }
      });
    };

    $scope.addReview = function(review) {
      console.log(review);
      var reviewParams = {
        review_id: review.id,
        review: review.review,
        movie_id: review.movie_id
      };

      $http.post("/api/v1/reviews/"+review.id+"/review.json", reviewParams).success(function(response) {
        review.review = response.review;
      }
    );
   };

  //  $scope.delReview = function(review) {
  //
  //  }


  });
})();
