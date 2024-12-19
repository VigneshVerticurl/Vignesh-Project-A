public with sharing class IMDBController {
  @AuraEnabled(cacheable=true)
  public static string getMovieName(String searchText) {
    try {
      String endpoint = 'https://api.collectapi.com/imdb/imdbSearchByName?query=' + searchText;
      Http http = new Http();
      HttpRequest request = new HttpRequest();

      // Set the HTTP method and endpoint
      request.setMethod('GET');
      request.setEndpoint(endpoint);

      // Add custom headers
      request.setHeader('Authorization', 'apikey 3XkTSLU4PBfZ6P7aEwkA02:5qsajrVrlvBeHxZJPPwTsF');

      try {
        // Send the HTTP request
        HttpResponse response = http.send(request);

        // Check the response status
        if (response.getStatusCode() == 200) {
          // Return the response body
          String res = response.getBody();
          return res;
        } else {
          return 'Error: ' + response.getStatus() + ' - ' + response.getBody();
        }
      } catch (Exception ex) {
        return 'Exception: ' + ex.getMessage();
      }
    } catch (Exception e) {
      throw new AuraHandledException(e.getMessage());
    }
  }
}
