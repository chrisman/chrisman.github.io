app.service('PortfolioService', function($http){
  
  console.log('hello from portfolio sercice');
  var portfolio = [];

  $http.get('/portfolio.json').then( r => {
    portfolio = r.data;
    console.log(portfolio);
  });

  return {
    getPortfolio: () => portfolio
  }

});
