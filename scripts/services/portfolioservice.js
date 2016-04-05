app.service('PortfolioService', function($http){
  
  var portfolio = [];
  var keywordList = [];

  var objectToKeywords = o => o.keywords;
  var flattenArray = (acc, curr) => {
    curr.forEach(e => {
      acc.push(e);
    });
    return acc;
  }
  var uniq = (e, idx, arr) => arr.indexOf(e) === idx;
  var toLowerCase = e => e.toLowerCase();

  $http.get('/portfolio.json').then( r => {

    portfolio = r.data;
    keywordList = portfolio
      .map(objectToKeywords)
      .reduce(flattenArray, [])
      .map(toLowerCase)
      .filter(uniq)
      .sort();
  });

  return {
    getPortfolio: () => portfolio,
    getKeywords: () => keywordList
  }

});
