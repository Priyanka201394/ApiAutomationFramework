function fn() {   
  var env = karate.env; 
  karate.log('karate.env system property was:', env);
  if (!env) {
    env = 'dev'; 
  }
  var config = { // base config JSON
    baseUrl: 'https://www.anapioficeandfire.com/api',
  };
  if (env == 'stage') {
    config.baseUrl = 'https://www.anapioficeandfire.com/api';
  } else if (env == 'e2e') {
    config.baseUrl = 'https://www.anapioficeandfire.com/api';
  }
  // connection Timeout if servers don't respond within 5 seconds
  karate.configure('connectTimeout', 5000);
  karate.configure('readTimeout', 5000);
  return config;
}