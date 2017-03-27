//subidospormiController
  app.controller('trashController',['$scope','topBannerService','documentosService','usuariosService',
      function($scope,topBannerService,documentosService,usuariosService) {

         topBannerService.setTitle("Papelera de reciclaje");
                      $scope.options = {
    rowSelection: false, multiSelect: false, autoSelect: false,decapitate: false, largeEditDialog: false,  boundaryLinks: false,
    limitSelect: true, pageSelect: true};
            $scope.limitOptions = [5, 10, 15, {
    label: 'All',
    value: function () {
      return $scope.documents ? $scope.documents.count : 0;
    }
  }];
          $scope.query = {
    order: 'name',
    limit: 10,
    page: 1
  };
        $scope.user = { id:$("#idUsuario").val() };
                $scope.documents =[];
                
            $scope.borrarORestaurar = function (document){
                document.idUsuario = $("#idUsuario").val();
            window.console.log(document);   
            if (document.deleted == false){
                          if (confirm('¿Esta seguro de que desea restaurar este documento?')) {
                   document.deleted = false;
                    documentosService.restoreDocument(document).then(function (data) {
                   $scope.getDocuments();

                });
} else {
   $scope.init();
}
    
            }
            else{
                    if (confirm('¿Esta seguro de que desea eliminar este documento?')) {
                   document.deleted = true;
                    documentosService.deleteDocument(document).then(function (data) {
                   $scope.getDocuments();

                });
} else {
   $scope.getDocuments();
}
    
            }
  }
            $scope.loggedUser = usuariosService.getLoggedUser();
            
            $scope.vaciarPapeleraDeReciclaje = function (){
                  if (confirm('¿Esta seguro de que desea vaciar la papelera de reciclaje?')) {
                   
                    documentosService.vaciarPapeleraDeReciclaje($scope.loggedUser).then(function () {
                   $scope.getDocuments();

                });
} else {
   $scope.getDocuments();
}
            }
            
            $scope.borrarParaSiempre = function (document){
                   if (confirm('¿Esta seguro de que desea borrar este archivo para siempre')) {
                   
                    documentosService.deleteDocumentForever(document).then(function () {
                   $scope.getDocuments();

                });
} else {
   $scope.getDocuments();
}
            }
            
             $scope.getDocuments = function (){
                    documentosService.getDeletedDocuments( ).then(function(d) {
                     
                        $scope.documents = documentosService.getList();
                        window.console.log($scope.documents);
                        
                    });
             };
                $scope.getDocuments();
      
              
                  
               
    }]);