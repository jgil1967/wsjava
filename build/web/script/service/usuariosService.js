app.service('usuariosService',function($http){
    var loggedUser = null;
    var usuarios = [];
       var usuario = "";
       var $event = "";
 var changeUsuario = function(event,d) {
          $event =  event;
         return usuario = d;
    };  
    
    var usuariosService = {
        getUsuarioByID: function(usuario) {
            
             return  $http({
    method: 'POST',
    url: "/wsjava/fimrest/restapi/getUsuarioByID",
    data: JSON.stringify(usuario)
}).then(function(result){
    
            loggedUser = result.data;
                
        });  
        },
        getLoggedUser: function() {
            return loggedUser;
            },
        
         getUsuarios: function(usuario) {
             window.console.log(usuario);
             
       return  $http({
    method: 'POST',
    url: "/wsjava/fimrest/restapi/getUsuarios",
    data: JSON.stringify(usuario)
}).then(function(result){
    
          usuarios = result.data;
            
        });  
        
             
    },
    getUsuariosForAdministrator: function() {
      var promise = $http.get('/wsjava/fimrest/restapi/getUsuariosForAdministrator').then(function (response) {
      usuarios = response.data;
      });
      return promise;
    },
    getList: function() {
       return usuarios;
    },
    addToList : function(usuario){
          usuarios.unshift(usuario);
    },
    changeUsuario:function($event,d){
           
            changeUsuario($event,d);
    },
      updateUsuarioDialog:function($event,d){
          
            changeUsuario($event,d);
    },
    updateUser: function(usuario) {
 return  $http({
    method: 'POST',
    url: "/wsjava/fimrest/restapi/updateUsuario",
    data: JSON.stringify(usuario)
}).then(function(result){
    
            return result.data;
        });  },
      createUsuario: function(usuario) {
 return  $http({
    method: 'POST',
    url: "/wsjava/fimrest/restapi/createUsuario",
    data: JSON.stringify(usuario)
}).then(function(result){
    
            return result.data;
        });  },
     verificaDisponibilidadUsuario: function(usuario) {
         //   window.console.log("verificaDisponibilidadUsuario");
 return  $http({
    method: 'POST',
    url: "/wsjava/fimrest/restapi/verificaDisponibilidadUsuario",
    data: JSON.stringify(usuario)
}).then(function(result){
    
            return result.data;
        });  },
    getUsuario: function() {
        var d = usuario;
        usuario = "";
       return d;
    },
    getEvent: function() {
       return $event;
    }
  
  };
      return usuariosService;
    });

