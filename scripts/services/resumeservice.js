app.service('ResumeService', function($http){
  
  var resume;

  $http.get('/resume.json').then( r => {
    resume = r.data;
  });

  return {
    getResume: () => resume
  }

});
