app.controller('searchController', ['$scope','$routeParams','topBannerService','objectsService','$location','$timeout','documentosService','areasService',
    function ($scope, $routeParams,topBannerService,objectsService,$location,$timeout,documentosService,areasService)
    {
        
         $scope.moverDocumento = function (event,document){
            documentosService.updateDocumentMoveDialog(event,document);
 }
 
    $scope.updateDocument = function ($event,document){
             document.vengoDeRootYPuedoCambiarDeArea = false;
       documentosService.updateDocumentDialog($event,document);
       
   }; 
        
        
        topBannerService.setTitle("Búsqueda");
         $scope.options = {
    rowSelection: false,
    multiSelect: false,
    autoSelect: false,
    decapitate: false,
    largeEditDialog: false,
    boundaryLinks: false,
    limitSelect: true,
    pageSelect: true
  };
   $scope.selected = [];
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

  $scope.toggleLimitOptions = function () {
    $scope.limitOptions = $scope.limitOptions ? undefined : [5, 10, 15];
  };


  $scope.onPaginate = function(page, limit) {
    console.log('Scope Page: ' + $scope.query.page + ' Scope Limit: ' + $scope.query.limit);
    console.log('Page: ' + page + ' Limit: ' + limit);
    $scope.promise = $timeout(function () {
    }, 1000);
  };



  $scope.onReorder = function(order) {
    console.log('Scope Order: ' + $scope.query.order);
    console.log('Order: ' + order);
    $scope.promise = $timeout(function () {
    }, 1000);
  };
        
        $scope.documents = [];
        $scope.areas = areasService.getList();
        if ($routeParams.searchTerm != ""){
            $scope.object = {
                areas:   $scope.areas ,
            document : { query: $routeParams.searchTerm}
        };
           
           objectsService.searchObjects($scope.object).then(function(searchResults) {
                window.console.log($scope.object);
               $scope.documents = objectsService.getSearchResults();
           }); 
        }
        
        $scope.touched=false;
         $scope.$watch(function(){return objectsService.getSearchTerm();}, function (search) 
       { 
           if (search  == ""  ) {  
                  $location.path('/');
           }
           else if (search  !=  "" && search  != undefined){
                   $scope.touched=true;
                  $location.path('/searchResults/' + search);
                 topBannerService.setTitle("Búsqueda");
                 $scope.documents = objectsService.getSearchResults();
                 window.console.log("Tamaño resultados :" + $scope.documents.length);
           }
           
           
       }, true);
        
         
    }]);