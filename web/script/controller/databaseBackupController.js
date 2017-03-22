//subidospormiController
  app.controller('databaseBackupController',['$scope','databaseBackupService','topBannerService',
      function($scope,databaseBackupService,topBannerService) {
topBannerService.setTitle("Respaldo de base de datos");

 databaseBackupService.getDatabaseBackupData().then(function() {
                   $scope.databaseBackupData = databaseBackupService.getData();
              window.console.log($scope.databaseBackupData);
                });
$scope.listoParaDescargar = false;
            $scope.createDatabaseBackupData = function (){
               databaseBackupService.createDatabaseBackup($scope.databaseBackupData).then(function (data) {
                 $scope.listoParaDescargar = true; 
               });
            
            };
               
    }]);