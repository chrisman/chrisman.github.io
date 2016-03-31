app.filter('cb_phonenumber', function(){
  return function(input){
    return "("+ input.slice(0,3) +") "+ input.slice(3,6) +"-"+ input.slice(6);
  }
});
