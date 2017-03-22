app.service('documentosService',function($http){
    var documents = [];
    var dates = {};
       var document = "";
       var documentGovernment = "";
       var documentMove = "";
       
       
       var $event = "";
 var changeDocument = function(event,d) {
          $event =  event;
         return document = d;
    };  
     var changeDocumentMove = function(event,d) {
          $event =  event;
         return documentMove = d;
    };  
    
    var documentosService = {
         getDocuments: function() {
      var promise = $http.get('/wsjava/fimrest/restapi/getDocuments').then(function (response) {
      documents = response.data;
      });
      return promise;
    },
      getDocumentGovernment: function(filter) {
          
            return  $http({
    method: 'POST',
    url: "/wsjava/fimrest/restapi/getDocumentGovernment",
    data: JSON.stringify(filter)
}).then(function(response){
    
           documentGovernment = response.data;
            
        }); 
        
//      var promise = $http.get('/wsjava/fimrest/restapi/getDocumentGovernment').then(function (response) {
//      documentGovernment = response.data;
//      });
//      return promise;
    },
     getDocumentsOnlyEnabled: function(areas) {
   
       return  $http({
    method: 'POST',
    url: "/wsjava/fimrest/restapi/getDocumentsOnlyEnabled",
    data: JSON.stringify(areas)
}).then(function(result){
    
          documents = result.data;
            
        });  
        
    },
    getDocumentsByFolder: function(folder) {
   
       return  $http({
    method: 'POST',
    url: "/wsjava/fimrest/restapi/getDocumentsByFolder",
    data: JSON.stringify(folder)
}).then(function(result){
    
          documents = result.data;
            
        });  
        
    },
      getDocumentsByUser: function(user) {
   
       return  $http({
    method: 'POST',
    url: "/wsjava/fimrest/restapi/getDocumentsByUser",
    data: JSON.stringify(user)
}).then(function(result){
    
          documents = result.data;
            
        });  
        
    },
      getDocumentsFilters: function(filters) {
            window.console.log("Filters: " + JSON.stringify(filters));
 return  $http({
    method: 'POST',
    url: "/wsjava/fimrest/restapi/getDocumentsFilters",
    data: JSON.stringify(filters)
}).then(function(result){
    
          documents = result.data;
            
        });  },
     getDatesDTO: function() {
      var promise = $http.get('/wsjava/fimrest/restapi/getDatesDTO').then(function (response) {
      dates = response.data;
      });
      return promise;
    },
    getList: function() {
       return documents;
    },
     getDocumentGovernmentObject: function() {
       return documentGovernment;
    },
    getDates: function() {
       return dates;
    },
    addToList : function(document){
          documents.unshift(document);
    },
    updateDocumentMoveDialog:function($event,d){
           
            changeDocumentMove($event,d);
    },
    updateDocumentDialog:function($event,d){
           
            changeDocument($event,d);
    },
    downloadDocument: function(document) {
 return  $http({
    method: 'POST',
    url: "/wsjava/fimrest/restapi/downloadDocument",
    data: JSON.stringify(document)
}).then(function(result){
    window.console.dir(result);
                window.console.log(result);
          // return result.data;
        });  },
    
    moveDocuments: function(documents) {
 return  $http({
    method: 'POST',
    url: "/wsjava/fimrest/restapi/moveDocuments",
    data: JSON.stringify(documents)
}).then(function(result){
    
            return result.data;
        });  },
    
     updateDocument: function(document) {
 return  $http({
    method: 'POST',
    url: "/wsjava/fimrest/restapi/updateDocument",
    data: JSON.stringify(document)
}).then(function(result){
    
            return result.data;
        });  },
    
    deleteDocument: function(document) {
 return  $http({
    method: 'POST',
    url: "/wsjava/fimrest/restapi/deleteDocument",
    data: JSON.stringify(document)
}).then(function(result){
    
            return result.data;
        });  },
      restoreDocument: function(document) {
 return  $http({
    method: 'POST',
    url: "/wsjava/fimrest/restapi/restoreDocument",
    data: JSON.stringify(document)
}).then(function(result){
    
            return result.data;
        });  },
      createDocument: function(document) {
 return  $http({
    method: 'POST',
    url: "/wsjava/fimrest/restapi/createDocument",
    data: JSON.stringify(document)
}).then(function(result){
    
            return result.data;
        });  },
    
    getDocument: function() {
        var d = document;
        document = "";
       return d;
    },
     getDocumentMove: function() {
        var d = documentMove;
        documentMove = "";
       return d;
    },
    getEvent: function() {
       return $event;
    }
  
  };
      return documentosService;
    });

