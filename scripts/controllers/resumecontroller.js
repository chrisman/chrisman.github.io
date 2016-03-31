app.controller('ResumeController', 
  ['$scope', 'ResumeService', 
  function($scope, ResumeService){ 

  $scope.resume = ResumeService.getResume();
  console.log('controller:',$scope.resume);

}])
