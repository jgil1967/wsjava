/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.uas.dbBackup;

import com.uas.properties.PropertiesFacade;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.Properties;

/**
 *
 * @author jonathangil
 */
public class DbBackupDAO  implements DbBackupInterface{

    
    
    
    @Override
    public DbBackupDTO backupDatabase(DbBackupDTO dto) {
    String command = dto.postgresqlPath;
    PropertiesFacade fac = new PropertiesFacade(); 
    
        
       if (  System.getProperty("os.name").toLowerCase().contains("windows")){
       command = command + "./pg_dump postgresql://";
       }
       else{
            command = command + "pg_dump postgresql://";
       }
     command = command +dto.getUser()+":"+dto.getPassword()+"@127.0.0.1:5432/"+dto.getDatabaseName() + "  > " +fac.obtenerValorPropiedad("pathForBackups")+  dto.getNombreBackup()+".sql;";
      try {
    Process process = Runtime.getRuntime().exec(new String[]{"sh", "-c", command});
    } catch (IOException e) {
        e.printStackTrace();
    }
     
     //si existe y no esta vacío
    return null;
    }

    @Override
    public DbBackupDTO llenarYRegresarPropiedades() {
        PropertiesFacade fac = new PropertiesFacade(); 
        DbBackupDTO dto = new DbBackupDTO();
        dto.setDatabaseName(fac.obtenerValorPropiedad("databaseName"));
        dto.setNombreBackup("DatabaseBackup-" + new Date().toString());
        dto.setPassword(fac.obtenerValorPropiedad("postgresqlPassword"));
        dto.setUser(fac.obtenerValorPropiedad("postgresqlUser"));
        dto.setPostgresqlPath(fac.obtenerValorPropiedad("postgresqlPath"));
        return dto;
    }
    
}
