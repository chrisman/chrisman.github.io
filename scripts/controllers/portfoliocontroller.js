app.controller('PortfolioController', 
  ['$scope', 'PortfolioService', 
  function($scope, PortfolioService){ 

  $scope.portfolio = PortfolioService.getPortfolio();
  $scope.keywords = PortfolioService.getKeywords();

}])
