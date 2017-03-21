app.service('databaseBackupService',function($http){
  
    var databaseBackupService = {
       
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

