app.service('areasService',function($http){
    var areas = [];
       var area = "";
       var $event = "";
 var changeArea = function(event,d) {
          $event =  event;
         return area = d;
    };  
    
    var areasService = {
         getAreas: function() {
      var promise = $http.get('/wsjava/fimrest/restapi/getAreas').then(function (response) {
      areas = response.data;
      });
      return promise;
    },
   getPossibleAreasByArea: function(area) {
            return  $http({
    method: 'POST',
    url: "/wsjava/fimrest/restapi/getPossibleAreasByArea",
    data: JSON.stringify(area)
}).then(function(result){
     
            return result.data;
        });
         
    },
     getAreasByArea: function(area) {
       return  $http({
    method: 'POST',
    url: "/wsjava/fimrest/restapi/getAreasByArea",
    data: JSON.stringify(area)
}).then(function(result){
     
            return result.data;
        });
         
    },
      getAreasByArea2: function(area) {
       return  $http({
    method: 'POST',
    url: "/wsjava/fimrest/restapi/getAreasByArea2",
    data: JSON.stringify(area)
}).then(function(response){
            
            areas = response.data;
            area.uploadAndEdit = true;
             areas.unshift(area);
              //  window.console.log("Areas retornadas : " + JSON.stringify(areas));
          
        });
         
    },
    getList: function() {
       return areas;
    },
    addToList : function(area){
          areas.unshift(area);
    },
    changeArea:function($event,d){
           
            changeArea($event,d);
    },
      updateAreaDialog:function($event,d){
          
            changeArea($event,d);
    },
      createArea: function(area) {
 return  $http({
    method: 'POST',
    url: "/wsjava/fimrest/restapi/createArea",
    data: JSON.stringify(area)
}).then(function(result){
    
            return result.data;
        });  },
    updateArea: function(area) {
        
 return  $http({
    method: 'POST',
    url: "/wsjava/fimrest/restapi/updateArea",
    data: JSON.stringify(area)
}).then(function(result){
    
            return result.data;
        });  },
    createAreaRelationship: function(area) {
 return  $http({
    method: 'POST',
    url: "/wsjava/fimrest/restapi/createAreaRelationship",
    data: JSON.stringify(area)
}).then(function(result){
    
            return result.data;
        });  },
     uploadAndEdit: function(area) {
 return  $http({
    method: 'POST',
    url: "/wsjava/fimrest/restapi/uploadAndEdit",
    data: JSON.stringify(area)
}).then(function(result){
    
            return result.data;
        });  },
    deleteAreaRelationship: function(area) {
 return  $http({
    method: 'POST',
    url: "/wsjava/fimrest/restapi/deleteAreaRelationship",
    data: JSON.stringify(area)
}).then(function(result){
    
            return result.data;
        });  },
    
    getArea: function() {
        var d = area;
        area = "";
       return d;
    },
    getEvent: function() {
       return $event;
    }
  
  };
      return areasService;
    });

