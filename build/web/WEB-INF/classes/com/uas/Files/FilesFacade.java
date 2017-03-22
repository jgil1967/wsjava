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
public class FilesFacade implements FilesInterface {
FilesInterface dao = null;

    public FilesFacade() {
        dao = new FilesDAO();
    }


    @Override
    public Boolean verificaSiExiste(String nombre) {
        return dao.verificaSiExiste(nombre);
    }

    @Override
    public String retornaNombreBienParaCarpeta(String nombre) {
        return dao.retornaNombreBienParaCarpeta(nombre);
    }

    @Override
    public String createFolder(String nombre) {
        return dao.retornaNombreBienParaCarpeta(nombre);
    }

    @Override
    public Boolean borrarCarpetaTemporales() {
        return dao.borrarCarpetaTemporales();
    }

    @Override
    public Boolean borrarCarpetaDescargas() {
       return dao.borrarCarpetaDescargas();
    }

    @Override
    public Boolean borrarCarpetaBackups() {
        return dao.borrarCarpetaBackups();
    }

    @Override
    public String guardarInputStreamAFile(InputStream inputStream, String destino) {
        return dao.guardarInputStreamAFile(inputStream, destino );
    }

    @Override
    public File getUniqueFilename(File file) {
        return dao.getUniqueFilename(file );
    }
    
}
