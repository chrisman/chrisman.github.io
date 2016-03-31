app.controller('HomeController',
  ['$scope', 'PortfolioService', 'ResumeService',
  function($scope, PortfolioService, ResumeService) { 

  $scope.portfolio = PortfolioService.getPortfolio();
  $scope.resume = ResumeService.getResume();

}])
