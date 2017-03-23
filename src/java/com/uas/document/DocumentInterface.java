/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.uas.document;

import com.uas.areas.areaDTO;
import com.uas.dates.filters.filtersDTO.FiltersDTO;
import com.uas.usuarios.UsuarioDTO;
import java.util.ArrayList;

/**
 *
 * @author jonathangil
 */
public interface DocumentInterface {
     DocumentDTO getDocument(DocumentDTO dDto);
     DocumentDTO createFolder(DocumentDTO dDto);
     DocumentDTO createDocument2(DocumentDTO dDto);
       ArrayList<DocumentDTO> getDocuments();
       ArrayList<DocumentDTO> getFolders(FilterForGovernmentDTO dto );
       ArrayList<DocumentDTO> getFoldersChildren(DocumentDTO dto,FilterForGovernmentDTO dDto);
       Boolean verificaSiEsDescendiente(ArrayList<DocumentDTO> documents);
       ArrayList<DocumentDTO> getDocumentsByFolder(DocumentDTO dto);
       ArrayList<DocumentDTO> getDocumentsOnlyEnabled(ArrayList<areaDTO> areas);
       ArrayList<DocumentDTO> getDocuments(FiltersDTO filters);
       DocumentDTO createDocument(DocumentDTO dDto);
     DocumentDTO updateDocument(DocumentDTO dDto);
     DocumentDTO updateDocument2ParaMove(DocumentDTO dDto);
       ArrayList <DocumentDTO> searchDocuments (FilterForGovernmentDTO dto);
        ArrayList<DocumentDTO> getDocumentsByUser(UsuarioDTO dto) ;
        DocumentGovernmentDTO getDocumentGovernment (FilterForGovernmentDTO dto);
        String moveDocuments (ArrayList<DocumentDTO> documents);
}
