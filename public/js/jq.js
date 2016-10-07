
(function(angular) {
  'use strict';
angular.module('sort', ['angular-sortable-view'])
  .controller('Controller', ['$scope', function($scope) {
    $scope.message="Hello person viewing this";
  
  $scope.prop = {};
  $scope.prop.images = [
      {id: 'http://www.adiumxtras.com/images/thumbs/dango_status_icon_set_7_19047_6248_thumb.png'},
      {id: 'https://upload.wikimedia.org/wikipedia/commons/thumb/1/1f/Red_information_icon_with_gradient_background.svg/48px-Red_information_icon_with_gradient_background.svg.png'},
      {id: 'https://www.haiku-os.org/docs/userguide/images/apps-images/icon-o-matic-icon_64.png'},
  ];
  }])
})(window.angular);

