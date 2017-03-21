/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.uas.Files;

import java.io.File;
import java.io.InputStream;

/**
 *
 * @author jonathangil
 */
public interface FilesInterface {
    public Boolean verificaSiExiste (String nombre);
    public String retornaNombreBienParaCarpeta (String nombre);
    public String createFolder (String nombre);
    public Boolean borrarCarpetaTemporales ();
    public Boolean borrarCarpetaDescargas ();
    public Boolean borrarCarpetaBackups ();
    public String guardarInputStreamAFile(InputStream inputStream, String destino);
    public File getUniqueFilename( File file );

}
