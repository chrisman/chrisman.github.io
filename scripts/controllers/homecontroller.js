app.controller('HomeController',
  ['$scope', 'PortfolioService', 
  function($scope, PortfolioService) { 

  $scope.portfolio = PortfolioService.getPortfolio();

}])
