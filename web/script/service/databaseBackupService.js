app.service('databaseBackupService',function($http){
  var getDatabaseBackupData = {};
    var databaseBackupService = {
          getDatabaseBackupData: function() {
      var promise = $http.get('/wsjava/fimrest/restapi/getDatabaseBackupData').then(function (response) {
      getDatabaseBackupData = response.data;
      });
      return promise;
    },
    getData: function (){
        return getDatabaseBackupData;
    },
      createDatabaseBackup: function(databaseBackupData) {
 return  $http({
    method: 'POST',
    url: "/wsjava/fimrest/restapi/createDatabaseBackup",
    data: JSON.stringify(databaseBackupData)
}).then(function(result){
    
            return result.data;
        });  }
  
  };
      return databaseBackupService;
    });

