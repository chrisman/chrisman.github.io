app.controller('PortfolioController', 
  ['$scope', 'PortfolioService', 
  function($scope, PortfolioService){ 

  $scope.portfolio = "wnpfduhlfpdwfpyd";

  $scope.portfolio = PortfolioService.getPortfolio();

}])
