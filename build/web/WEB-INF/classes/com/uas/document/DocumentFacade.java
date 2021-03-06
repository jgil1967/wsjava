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
public class DocumentFacade implements DocumentInterface {
DocumentInterface dDao = null;

    public DocumentFacade() {
dDao = new DocumentDAO ();
    }

    @Override
    public DocumentDTO getDocument(DocumentDTO dDto) {
  return dDao.getDocument(dDto) ; }

    @Override
    public ArrayList<DocumentDTO> getDocuments() {
        return dDao.getDocuments();
    }

    @Override
    public DocumentDTO createDocument(DocumentDTO dDto) {
        return dDao.createDocument(dDto);
    }

//    @Override
//    public DocumentDTO updateDocument(DocumentDTO dDto) {
//return dDao.updateDocument (dDto);
//    }

    @Override
    public ArrayList<DocumentDTO> searchDocuments(FilterForGovernmentDTO dto) {
   return dDao.searchDocuments (dto);
    }

    @Override
    public DocumentDTO updateDocument(DocumentDTO dDto) {
        return dDao.updateDocument(dDto);
    }

    @Override
    public ArrayList<DocumentDTO> getDocuments(FiltersDTO dto) {
   return dDao.getDocuments(dto);
    }

    @Override
    public ArrayList<DocumentDTO> getDocumentsOnlyEnabled(ArrayList<areaDTO> areas) {
      return dDao.getDocumentsOnlyEnabled(areas);
    }

    @Override
    public ArrayList<DocumentDTO> getDocumentsByUser(UsuarioDTO dto) {
    return dDao.getDocumentsByUser(dto); }

    @Override
    public ArrayList<DocumentDTO> getDocumentsByFolder(DocumentDTO dto) {
    return dDao.getDocumentsByFolder(dto); }

    @Override
    public DocumentDTO createFolder(DocumentDTO dDto) {
        return dDao.createFolder(dDto);
    }

    @Override
    public DocumentDTO createDocument2(DocumentDTO dDto) {
        return dDao.createDocument2(dDto);
    }

    @Override
    public ArrayList<DocumentDTO> getFolders(FilterForGovernmentDTO dto) {
        return dDao.getFolders(dto);
    }

    @Override
    public DocumentGovernmentDTO getDocumentGovernment(FilterForGovernmentDTO dto) {
      return dDao.getDocumentGovernment(dto);
    }

    @Override
    public ArrayList<DocumentDTO> getFoldersChildren(DocumentDTO dto,FilterForGovernmentDTO fDto) {
        return dDao.getFoldersChildren(dto,fDto);
    }

    @Override
    public String moveDocuments(ArrayList<DocumentDTO> documents) {
        return dDao.moveDocuments(documents);
    }

    @Override
    public Boolean verificaSiEsDescendiente(ArrayList<DocumentDTO> documents) {
           return dDao.verificaSiEsDescendiente(documents);
    }

    @Override
    public DocumentDTO updateDocument2ParaMove(DocumentDTO dDto) {
        return dDao.updateDocument2ParaMove(dDto);
    }

    @Override
    public ArrayList<DocumentDTO> getAllDescendants(DocumentDTO dto) {
      return dDao.getAllDescendants(dto);
    }

    @Override
    public DocumentDTO updateDocumentArea(DocumentDTO dDto) {
       return dDao.updateDocumentArea(dDto);
    }

    @Override
    public DocumentDTO updateDocumentFilename(DocumentDTO dDto) {
       return dDao.updateDocumentFilename(dDto);
    }

    @Override
    public DocumentDTO deleteDocument2(DocumentDTO dDto) {
       return dDao.deleteDocument2(dDto);
    }

    @Override
    public DocumentDTO restoreDocument2(DocumentDTO dDto) {
     return dDao.restoreDocument2(dDto);
    }

    @Override
    public DocumentDTO updateDocumentDeleted(DocumentDTO dDto) {
       return dDao.updateDocumentDeleted(dDto);
    }

    @Override
    public ArrayList<DocumentDTO> getAllDescendantsAndCopy(DocumentDTO dto) {
        return dDao.getAllDescendantsAndCopy(dto);
    }

    @Override
    public ArrayList<DocumentDTO> getAllDescendantsAndDelete(DocumentDTO dto) {
       return dDao.getAllDescendantsAndDelete(dto);
    }

    @Override
    public DocumentDTO copyDocumentToTrash(DocumentDTO dto) {
       return dDao.copyDocumentToTrash(dto);
    }

    @Override
    public DocumentDTO deleteDocumentFromSource(DocumentDTO dto) {
       return dDao.deleteDocumentFromSource(dto);
    }

    @Override
    public ArrayList<DocumentDTO> getDeletedDocuments() {
     return dDao.getDeletedDocuments();
    }
    
}
