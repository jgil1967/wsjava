/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.uas.googleDrive;

import com.uas.document.DocumentDTO;
import com.uas.document.DocumentDTO;
import com.uas.googleDriveBackups.googleDriveBackupDTO;
import java.io.IOException;

/**
 *
 * @author jonathangil
 */
public interface googleDriveInterface {
      public void pruebaDrive ();
      public googleDriveBackupDTO subirArchivos ();
     public DocumentDTO backupDocument  (DocumentDTO dto);
     public DocumentDTO backupFolder  (DocumentDTO dto);
       public void zipFolder(String srcFolder, String destZipFile) throws Exception;
       public void uploadFile (DocumentDTO dto, String nombreBackup, String zipFilePath) throws IOException;
}
