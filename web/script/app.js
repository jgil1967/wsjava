/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


var app = angular.module('appApp', ['ngRoute','ngMaterial', 'ngMessages','md.data.table','ngTagsInput','ui.materialize','angular-loading-bar'])
.config(function($mdThemingProvider) {
  $mdThemingProvider.theme('default')
    .primaryPalette('blue')
    .accentPalette('blue');
});

app.config(function($routeProvider) {
        $routeProvider
            .when('/', {
                templateUrl : '/wsjava/pages/documentos.html',
                controllerAs: 'ctrl',
                controller  : ''
            })
             .when('/userSettings', {
                templateUrl : '/wsjava/pages/userSettings.html',
                controllerAs: 'ctrl',
                controller  : 'userSettingsController'
            })
            
               .when('/transactions', {
                templateUrl : '/wsjava/pages/transactions.html',
                controllerAs: 'ctrl',
                controller  : 'transactionsController'
            })
             .when('/databaseBackup', {
                templateUrl : '/wsjava/pages/databaseBackup.html',
                controllerAs: 'ctrl',
                controller  : 'databaseBackupController'
            })
            
            .when('/documentsBackup', {
                templateUrl : '/wsjava/pages/documentsBackup.html',
                controllerAs: 'ctrl',
                controller  : 'documentsBackupController'
            })
              .when('/documentos', {
                templateUrl : '/wsjava/pages/documentos.html',
                controllerAs: 'ctrl',
                controller  : ''
            })
              .when('/usuarios', {
                templateUrl : '/wsjava/pages/usuarios.html',
                controllerAs: 'ctrl',
                controller  : 'usuariosController'
            })
             .when('/subidospormi', {
                templateUrl : '/wsjava/pages/subidospormi.html',
                controllerAs: 'ctrl',
                controller  : 'subidospormiController'
            })
            .when('/keywords', {
                templateUrl : '/wsjava/pages/keywords.html',
                controllerAs: 'ctrl',
                controller  : 'keywordsController'
            })
            .when('/areas', {
                templateUrl : '/wsjava/pages/areas.html',
                controllerAs: 'ctrl',
                controller  : 'areasController'
            })
             .when('/busqueda', {
                templateUrl : '/wsjava/pages/busqueda.html',
                controllerAs: 'ctrl',
                controller  : 'searchController'
            })
             .when('/documentos/:id', {
                templateUrl : '/wsjava/pages/documento.html',
                controller  : 'documentoController'
            })
            .when('/searchResults/:searchTerm', {
                templateUrl : '/wsjava/pages/searchResults.html',
                controller  : 'searchController'
            })
          
    });



     app.directive('fileModel', ['$parse', function ($parse) {
            return {
               restrict: 'A',
               link: function(scope, element, attrs) {
                  var model = $parse(attrs.fileModel);
                  var modelSetter = model.assign;
                  
                  element.bind('change', function(){
                     scope.$apply(function(){
                        modelSetter(scope, element[0].files[0]);
                     });
                  });
               }
            };
         }]);
     
     
app.service('fileUpload', ['$http', function ($http) {
    this.uploadFileAndFieldsToUrl = function(file, fields, uploadUrl){
        var fd = new FormData();
        fd.append('file', file);
        for(var i = 0; i < fields.length; i++){
            fd.append(fields[i].name, fields[i].data)
        }
        $http.post(uploadUrl, fd, {
            transformRequest: angular.identity,
            headers: {'Content-Type': undefined}
        })
        .success(function(){
                       return true;
        })
        .error(function(){
           return false;
        });
    }
}]);



