/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.uas.Files;

import com.uas.properties.PropertiesFacade;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import org.apache.commons.io.FilenameUtils;

/**
 *
 * @author jonathangil
 */
public class FilesDAO implements FilesInterface {

    @Override
    public Boolean verificaSiExiste(String nombre) {
        
        File file = new File (nombre);
        return file.exists();
        
    }

    @Override
    public String retornaNombreBienParaCarpeta(String nombre) {
        
       
    
    try {
       Boolean searching = true;
        int count = 1;
while (searching) {
  
   File f = new File(nombre);

    if(f.exists()) {
        count++;
        nombre = nombre + "( " + count + ")";
    } else {
        
        searching = false;
        return nombre;
    }
} 
    } catch (Exception e) {
        e.printStackTrace();
    }
    return nombre;
    }

    @Override
    public String createFolder(String nombre) {
        File file = new File(nombre);
        if (!verificaSiExiste(nombre)){
            nombre = retornaNombreBienParaCarpeta(nombre);
        }
        boolean b = false;
        if (!file.exists()) {
            b = file.mkdirs();
        }
       return nombre;
    }
 public static void deleteFolder(File folder) {
    File[] files = folder.listFiles();
    if(files!=null) { //some JVMs return null for empty dirs
        for(File f: files) {
            if(f.isDirectory()) {
                deleteFolder(f);
            } else {
                f.delete();
            }
        }
    }
    
}
    @Override
    public Boolean borrarCarpetaTemporales() {
        PropertiesFacade fac = new PropertiesFacade ();
         File f = new File(fac.obtenerValorPropiedad("pathForTemporaryFiles"));
            deleteFolder(f);
            return true;
    }

    @Override
    public Boolean borrarCarpetaDescargas() {
          PropertiesFacade fac = new PropertiesFacade ();
         File f = new File(fac.obtenerValorPropiedad("pathForFolderDownloads"));
            deleteFolder(f);
            return true;
    }

    @Override
    public Boolean borrarCarpetaBackups() {
         PropertiesFacade fac = new PropertiesFacade ();
         File f = new File(fac.obtenerValorPropiedad("pathForDocumentBackups"));
            deleteFolder(f);
            return true;
    }

    @Override
    public String guardarInputStreamAFile(InputStream inputStream, String destino) {
        //Es importante crear las carpetas
        try {
			OutputStream out = new FileOutputStream(new File(destino));
			int read = 0;
			byte[] bytes = new byte[1024];

			out = new FileOutputStream(new File(destino));
			while ((read = inputStream.read(bytes)) != -1) {
				out.write(bytes, 0, read);
			}
			out.flush();
			out.close();
                        inputStream.close();
		} catch (Exception e) {

			e.printStackTrace();
		}

                return destino;
    }

    @Override
    public File getUniqueFilename(File file) {
        String baseName = FilenameUtils.getBaseName( file.getName() );
    String extension = FilenameUtils.getExtension( file.getName() );
    int counter = 1;
        
    while(file.exists())
    {
        file = new File( file.getParent(), baseName + "-" + (counter++) + "." + extension );
    }
    return file;
    }



    
    
}
