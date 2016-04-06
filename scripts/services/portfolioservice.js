app.service('PortfolioService', function($http){
  
  var portfolio = [];
  var keywordList = [];

  var projectToKeywords = o => o.keywords;
  var flattenArray = (acc, curr) => {
    curr.forEach(e => {
      acc.push(e);
    });
    return acc;
  }
  var toLowerCase = s => s.toLowerCase();
  var uniq = (e, idx, arr) => arr.indexOf(e) === idx;
  var compareValues = (x, y) => +(x.value > y.value) || +(x.value === y.value) - 1;
  var keywordWithIndex = (e, i) => {
    return {
      "value": e,
      "index": i 
    }
  };

  $http.get('/portfolio.json').then( r => {

    portfolio = r.data;

    var keywordsUnsorted = portfolio
      .map(projectToKeywords)
      .reduce(flattenArray, [])
      .filter(uniq)
    var keywordsWithIndex = keywordsUnsorted
      .map(toLowerCase)
      .map(keywordWithIndex)
      .sort(compareValues);
    keywordList = keywordsWithIndex.map( e => keywordsUnsorted[e.index]);
  });

  return {
    getPortfolio: () => portfolio,
    getKeywords: () => keywordList
  }

});
