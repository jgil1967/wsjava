/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.uas.document;

import com.uas.Files.FilesFacade;
import com.uas.areas.areaDTO;
import com.uas.areas.areaFacade;
import com.uas.dates.filters.filtersDTO.FiltersDTO;
import com.uas.dbutil.DataSourceSingleton;
import com.uas.documentRelationship.DocumentRelationshipDTO;
import com.uas.documentRelationship.DocumentRelationshipFacade;
import com.uas.keyword.KeywordFacade;
import com.uas.object.ObjectFacade;
import com.uas.properties.PropertiesFacade;
import com.uas.transactionRecord.TransactionRecordDTO;
import com.uas.transactionRecord.TransactionRecordFacade;
import com.uas.usuarios.UsuarioDTO;
import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.lang.reflect.InvocationTargetException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.TimeZone;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.io.FilenameUtils;

/**
 *
 * @author jonathangil
 */
public class DocumentDAO implements DocumentInterface {
KeywordFacade kFac = null;

    @Override
    public DocumentDTO getDocument(DocumentDTO document) {
   
      ascendientes = new ArrayList<Boolean>();
        PropertiesFacade pDto = new PropertiesFacade();
       
        ResultSet rs = null;
        Connection c = null;
        PreparedStatement ps = null;
       DocumentDTO dtoNew=null;
           try {
          c = DataSourceSingleton.getInstance().getConnection(); 
           String SQL = "SELECT \"object\".\"id\", \"object\".\"name\", \"document\".\"fileName\", \"document\".\"isFolder\", \"document\".\"deleted\", \"document\".\"fileDate\", \"document\".\"backedUp\", \"document\".\"idArea\", \"object3\".\"name\" AS \"nameArea\", \"area\".\"folderName\" FROM \"document\" JOIN \"object\" ON \"document\".\"id\" = \"object\".\"id\" JOIN \"object\" AS \"object2\" ON \"object\".\"createdBy\" = \"object2\".\"id\" JOIN \"area\" ON \"document\".\"idArea\" = \"area\".\"id\" JOIN \"object\" AS \"object3\" ON \"area\".\"id\" = \"object3\".\"id\" WHERE \"object\".\"id\" = ?";
               ps = c.prepareStatement(SQL);
               ps.setInt(1,document.getId());
                 rs = ps.executeQuery();
                   while (rs.next()) {
                       dtoNew = new DocumentDTO();
                       dtoNew.setIsFolder(rs.getBoolean("isFolder"));
                       dtoNew.setId(rs.getInt("id"));
                       dtoNew.setName(rs.getString("name"));
                       dtoNew.setFileDate(rs.getString("fileDate"));
                        dtoNew.setFilename(rs.getString("filename"));
                        dtoNew.setDeleted(rs.getBoolean("deleted"));
                        dtoNew.setAscendenteBorrado(rs.getBoolean("deleted"));
                    dtoNew.setIdArea(rs.getInt("idArea"));
                   dtoNew.getArea().setName(rs.getString("nameArea"));
                   dtoNew.getArea().setFolderName(rs.getString("folderName"));
                   dtoNew.setBackedUp(rs.getBoolean("backedUp"));
                   
                        String pathTrash = pDto.obtenerValorPropiedad("pathForTrash");
                       String fullPathOriginal =  pDto.obtenerValorPropiedad("pathForFiles");
                 //   //System.out.println("#######################");
                        savingUp = "";
                        getFullPath(dtoNew,dtoNew.getFilename());
                        String fp = savingUp;
                       // //System.out.println("ascendientes : " + ascendientes.size());
                        for(Boolean b : ascendientes){
                            if (b){
                                dtoNew.setAscendenteBorrado(true);
                                break;
                            }
                        }
                        
                       //System.out.println("FP : " + fp);
                       //System.out.println("#######################");
                    dtoNew.setFullPathToFolder(  fullPathOriginal  + dtoNew.getArea().getFolderName()   + "/"+fp);
                    dtoNew.setFullPathToFolderInDeleted(pathTrash  + dtoNew.getArea().getFolderName()   + "/"+fp);
                    //System.out.println("setFullPathToFolder : " + dtoNew.getFullPathToFolder());
                     //System.out.println("setFullPathToFolderInDeleted : " + dtoNew.getFullPathToFolderInDeleted());
                   
                   }
         }
         catch (Exception e){
             e.printStackTrace();
         }
         finally{
             try{
                 if (rs != null){
                     rs.close();
                 }
                  if (c != null){
                     c.close();
                 }
                   if (ps != null){
                     ps.close();
                 }
                   
                    
                
             }
             catch (Exception e2){
                 e2.printStackTrace();
             }
         }
        return dtoNew;
    
    }

    @Override
    public ArrayList<DocumentDTO> getDocuments() {
       kFac = new KeywordFacade ();
        ArrayList<DocumentDTO> documents = null;
     DocumentDTO document = null;
       
        ResultSet rs = null;
        Connection c = null;
        PreparedStatement ps = null;
       documents = new ArrayList<DocumentDTO> ();
         try {
          c = DataSourceSingleton.getInstance().getConnection(); 
           String SQL = "SELECT \"object\".\"id\",\"object\".\"createdBy\", \"object\".\"name\", \"object\".\"description\", \"object\".\"createdOn\", \"object\".\"createdBy\", \"object\".\"color\", \"object\".\"kind\", \"document\".\"fileName\", \"document\".\"isFolder\", \"document\".\"fileDate\", \"document\".\"deleted\", \"document\".\"backedUp\", \"document\".\"idArea\", \"object3\".\"name\" AS \"nameArea\", \"object2\".\"name\" AS \"nameCreatedBy\" FROM \"document\" JOIN \"object\" ON \"document\".\"id\" = \"object\".\"id\" JOIN \"object\" AS \"object3\" ON \"document\".\"idArea\" = \"object3\".\"id\" JOIN \"object\" AS \"object2\" ON \"object\".\"createdBy\" = \"object2\".\"id\"  WHERE  \"object\".\"id\" NOT IN (SELECT \"documentRelationships\".\"idDocumentChild\" FROM \"documentRelationships\")  ORDER BY \"object\".\"createdOn\" ASC";
               ps = c.prepareStatement(SQL);
                 rs = ps.executeQuery();
                   while (rs.next()) {
                       document = new DocumentDTO();
                       document.setIsFolder(rs.getBoolean("isFolder"));
                       document.setId(rs.getInt("id"));
                       document.setCreatedBy(rs.getInt("createdBy"));
                       document.setName(rs.getString("name"));
                       document.setDescription(rs.getString("description"));
                        document.setColor(rs.getString("color"));
                        document.setCreatedOn(rs.getTimestamp("createdOn"));
                        document.setKind(rs.getString("kind"));
                        document.setFilename(rs.getString("filename"));
                        document.setKeywords(kFac.getKeywordsByDocument(document));
                    document.setFileDate(rs.getString("fileDate"));
               document.setDeleted(rs.getBoolean("deleted"));
                    document.setIdArea(rs.getInt("idArea"));
                   document.getArea().setName(rs.getString("nameArea"));
                   document.getUser().setName(rs.getString("nameCreatedBy"));
                   document.setBackedUp(rs.getBoolean("backedUp"));
                  document.setVengoDeRootYPuedoCambiarDeArea(true);
                   
                      documents.add(document);
                   }
         }
         catch (Exception e){
             e.printStackTrace();
         }
         finally{
             try{
                 if (rs != null){
                     rs.close();
                 }
                  if (c != null){
                     c.close();
                 }
                   if (ps != null){
                     ps.close();
                 }
                   
                    
                
             }
             catch (Exception e2){
                 e2.printStackTrace();
             }
         }
        return documents;
    }

    @Override
    public DocumentDTO createDocument(DocumentDTO dDto) {
      PreparedStatement preparedStmt = null;
        Connection c = null;
        ResultSet rs =null;
        // 
       try {
          c = DataSourceSingleton.getInstance().getConnection(); 
          String SQL = "INSERT INTO \"public\".\"document\" (\"id\",\"fileName\",\"fileDate\",\"idArea\",\"isFolder\") VALUES (?,?,?,?,?)";
     	preparedStmt = c.prepareStatement(SQL);
         preparedStmt.setInt(1, dDto.getId());
             //System.out.println("");
            preparedStmt.setString(2, dDto.getFilename());
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
             ////System.out.println("Dto.getFileDate().substring(0,10): " + dDto.getFileDate().substring(0,10));
            java.util.Date parsedDate = dateFormat.parse(dDto.getFileDate().substring(0,10));
            Timestamp timestamp = new java.sql.Timestamp(parsedDate.getTime());
            preparedStmt.setTimestamp(3, timestamp);
            preparedStmt.setInt(4, dDto.getIdArea());
            preparedStmt.setBoolean(5, dDto.getIsFolder());
          preparedStmt.executeUpdate();
             
               TransactionRecordFacade tFac = new TransactionRecordFacade();
             TransactionRecordDTO tDto = new TransactionRecordDTO();
             tDto.getObjectDTO().setId(dDto.getId());
             tDto.getTransactionTypeDTO().setId(3);
             tDto.getUsuarioDTO().setId(dDto.getCreatedBy());
             tFac.createTransactionRecord(tDto);
         }
          catch (Exception e)
            {
        	e.printStackTrace();
            }
        finally{
            try {
               if (c != null) {
                    c.close();
                }
                if (rs != null) {

                    rs.close();
                }
                if (preparedStmt != null) {
                    preparedStmt.close();
                }
                    
                
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    return dDto;  }

    

    @Override
    public ArrayList<DocumentDTO> searchDocuments(FilterForGovernmentDTO dto) {
          kFac = new KeywordFacade ();
        ArrayList<DocumentDTO> documents = null;
     DocumentDTO document = null;
       
        ResultSet rs = null;
        Connection c = null;
        PreparedStatement ps = null;
       documents = new ArrayList<DocumentDTO> ();
          try {
          c = DataSourceSingleton.getInstance().getConnection(); 
           String SQL = "SELECT \"document\".\"id\", \"document\".\"fileName\", \"document\".\"backedUp\", \"document\".\"isFolder\", \"document\".\"idArea\", \"document\".\"deleted\", \"document\".\"fileDate\", \"object\".\"name\", \"object\".\"createdBy\", \"object\".\"createdOn\", \"object\".\"description\", \"object\".\"kind\", \"object2\".\"name\" AS \"nameArea\", \"object3\".\"name\" AS \"nameCreatedBy\" FROM \"document\" JOIN \"object\" ON \"document\".\"id\" = \"object\".\"id\" JOIN \"area\" ON \"document\".\"idArea\" = \"area\".\"id\" JOIN \"object\" AS \"object2\" ON \"area\".\"id\" = \"object2\".\"id\" JOIN \"usuario\" ON \"object\".\"createdBy\" = \"usuario\".\"id\" JOIN \"object\" AS \"object3\" ON \"usuario\".\"id\" = \"object3\".\"id\" where (unaccent (\"object\".\"name\") ILIKE unaccent (?) or unaccent(\"object\".\"description\") ILIKE unaccent(?))";
           if (dto.getAreas().size()>0){
                 SQL = SQL + " AND ("; 
              }
               for (int a=0;a<dto.getAreas().size();a++){
                 //  //System.out.println("area : " + areas.get(a).getName() + "  " + areas.get(a).isUploadAndEdit());
                  SQL = SQL + "\"document\".\"idArea\" = " + dto.getAreas().get(a).getId();
                  if (!(a == dto.getAreas().size()-1)){
                      SQL = SQL + " OR ";
                  }
                  else{
                      SQL = SQL + " ) ";
                  }
              }       
           ps = c.prepareStatement(SQL);
               ps.setString(1, "%"+dto.getDocument().getQuery() + "%");
               ps.setString(2, "%"+dto.getDocument().getQuery() + "%");
                 rs = ps.executeQuery();
                   while (rs.next()) {
                       document = new DocumentDTO();
                      document.setIsFolder(rs.getBoolean("isFolder"));
                       document.setId(rs.getInt("id"));
                       document.setCreatedBy(rs.getInt("createdBy"));
                       document.setName(rs.getString("name"));
                       document.setDescription(rs.getString("description"));
                        document.setCreatedOn(rs.getTimestamp("createdOn"));
                        document.setKind(rs.getString("kind"));
                        document.setFilename(rs.getString("filename"));
                        document.setKeywords(kFac.getKeywordsByDocument(document));
                    document.setFileDate(rs.getString("fileDate"));
               document.setDeleted(rs.getBoolean("deleted"));
                    document.setIdArea(rs.getInt("idArea"));
                   document.getArea().setName(rs.getString("nameArea"));
                   document.getUser().setName(rs.getString("nameCreatedBy"));
                   document.setBackedUp(rs.getBoolean("backedUp"));
                        
                      documents.add(document);
                   }
         }
         catch (Exception e){
             e.printStackTrace();
         }
         finally{
             try{
                 if (rs != null){
                     rs.close();
                 }
                  if (c != null){
                     c.close();
                 }
                   if (ps != null){
                     ps.close();
                 }
                    
                
             }
             catch (Exception e2){
                 e2.printStackTrace();
             }
         }
        return documents;}

    @Override
    public DocumentDTO updateDocument(DocumentDTO dDto) {
        DocumentDTO dtoViejo = getDocument(dDto);
        DocumentDTO objectDto = null;
        ResultSet rs = null;
        Connection c = null;
        PreparedStatement preparedStmt = null;
     
          try {
          c = DataSourceSingleton.getInstance().getConnection(); 
            String SQL = "update \"public\".\"document\" set \"fileDate\"=?,\"deleted\"=?,\"backedUp\"=?,\"idArea\"=? where \"id\"=? ";
                preparedStmt = c.prepareStatement(SQL);
          SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date parsedDate = dateFormat.parse(dDto.getFileDate().substring(0,10));
            Timestamp timestamp = new java.sql.Timestamp(parsedDate.getTime());
            preparedStmt.setTimestamp(1, timestamp);
            preparedStmt.setBoolean(2, dDto.getDeleted());
             //System.out.println("dDto.getBackedUp() : " + dDto.getBackedUp());
            preparedStmt.setBoolean(3, dDto.getBackedUp());
            preparedStmt.setInt(4, dDto.getIdArea());
            preparedStmt.setInt(5, dDto.getId());
                preparedStmt.executeUpdate();
                //System.out.println("dDto.getVengoDeRootYPuedoCambiarDeArea() : " + dDto.getVengoDeRootYPuedoCambiarDeArea());
                if ((dtoViejo.getIdArea() != dDto.getIdArea()) && (dDto.getVengoDeRootYPuedoCambiarDeArea())){
                     DocumentDTO dtoNuevo = getDocument(dDto);
                     if (dDto.getDeleted()){
                          Files.createDirectories(Paths.get(dtoNuevo.getFullPathToFolderInDeleted()).getParent()); 
                            Files.move(Paths.get(dtoViejo.getFullPathToFolderInDeleted()), Paths.get(dtoNuevo.getFullPathToFolderInDeleted()));
                             }
                     else{
                         //Si 
                         Files.createDirectories(Paths.get(dtoNuevo.getFullPathToFolder()).getParent()); 
                         Files.move(Paths.get(dtoViejo.getFullPathToFolder()), Paths.get(dtoNuevo.getFullPathToFolder()));
                        }
                      }
              /* if (!dDto.getBackedUp()){
             TransactionRecordFacade tFac = new TransactionRecordFacade();
             TransactionRecordDTO tDto = new TransactionRecordDTO();
             tDto.getObjectDTO().setId(dDto.getId());
             tDto.getTransactionTypeDTO().setId(4);
             tDto.getUsuarioDTO().setId(dDto.getCreatedBy());
             tFac.createTransactionRecord(tDto);
               }
   */
               
              
    }
         catch (Exception e){
             e.printStackTrace();
         }
         finally{
             try{
                 if (rs != null){
                     rs.close();
                 }
                  if (c != null){
                     c.close();
                 }
                   if (preparedStmt != null){
                     preparedStmt.close();
                 }
                    
                
             }
             catch (Exception e2){
                 e2.printStackTrace();
             }
         
         }
         return dDto; }

    
    
    ///POR AREAS WEY
    @Override
    public ArrayList<DocumentDTO> getDocuments(FiltersDTO filters) {
     PreparedStatement ps = null;
             Connection c = null;
        ResultSet rs =null;
        ArrayList<DocumentDTO> documents = null;
        
        try{
             
       ////System.out.println("Keywords : "+ filters.getKeywords().size());
        ////System.out.println(filters.toString());
        ////System.out.println("QUery : " + filters.getFilterQuery());
        String SQL = "";
        
        
//        if (filters.getKeywords().size()>0){
//            //System.out.println("Hay keywords");
//            SQL += "SELECT DISTINCT ON( \"documentKeywordRelationship\".\"idDocument\") \"documentKeywordRelationship\".\"idDocument\", \"object\".\"name\", \"documentKeywordRelationship\".\"idKeyword\", \"document\".\"id\", \"document\".\"fileName\", \"document\".\"idArea\", \"document\".\"fileDate\", \"object2\".\"id\" AS \"id_0\", \"object2\".\"name\" AS \"name_0\", \"object2\".\"description\", \"object2\".\"createdOn\", \"object2\".\"createdBy\", \"object2\".\"color\", \"object2\".\"kind\" FROM \"documentKeywordRelationship\" JOIN \"keyword\" ON \"documentKeywordRelationship\".\"idKeyword\" = \"keyword\".\"id\" JOIN \"object\" ON \"keyword\".\"id\" = \"object\".\"id\" JOIN \"document\" ON \"documentKeywordRelationship\".\"idDocument\" = \"document\".\"id\" JOIN \"object\" AS \"object2\" ON \"document\".\"id\" = \"object2\".\"id\" ";
//        }
        //|| !filters.getFilterQuery().equals("") 
          if ( filters.getKeywords().size()>0 ||filters.getDates().getOldestCreatedOn() != null || filters.getDates().getNewestCreatedOn() != null|| filters.getDates().getOldestFileDate() != null|| filters.getDates().getNewestFileDate() != null){
               SQL += "SELECT \"documentKeywordRelationship\".\"idDocument\", \"object\".\"createdBy\", \"object\".\"name\" AS \"keywordName\", \"documentKeywordRelationship\".\"idKeyword\", \"document\".\"id\", \"document\".\"fileName\", \"document\".\"isFolder\", \"document\".\"idArea\", \"document\".\"fileDate\", \"object2\".\"id\" AS \"id_0\", \"object2\".\"name\" AS \"name\", \"object2\".\"description\", \"object2\".\"createdOn\", \"object2\".\"createdBy\" AS \"createdBy_0\", \"object2\".\"color\", \"object2\".\"kind\", \"object3\".\"name\" AS \"nameArea\", \"object_alias1\".\"name\" AS \"nameCreatedBy\" FROM \"documentKeywordRelationship\" JOIN \"keyword\" ON \"documentKeywordRelationship\".\"idKeyword\" = \"keyword\".\"id\" JOIN \"object\" ON \"keyword\".\"id\" = \"object\".\"id\" JOIN \"document\" ON \"documentKeywordRelationship\".\"idDocument\" = \"document\".\"id\" JOIN \"object\" AS \"object2\" ON \"document\".\"id\" = \"object2\".\"id\" JOIN \"object\" AS \"object3\" ON \"document\".\"idArea\" = \"object3\".\"id\" JOIN \"object\" AS \"object_alias1\" ON \"object2\".\"createdBy\" = \"object_alias1\".\"id\" ";
              //System.out.println("QUERY 1");
              SQL +=" where ";
          }
         
          
          for (int i = 0;i<filters.getKeywords().size();i++){
              SQL = SQL + "\"documentKeywordRelationship\".\"idKeyword\" = "+filters.getKeywords().get(i).getId()+" ";
            
             if (i<filters.getKeywords().size()-1){
                  SQL = SQL + " OR ";
              }
          }
//!filters.getFilterQuery().equals("") || 
          
 if (filters.getKeywords().size()>0 && (filters.getDates().getOldestCreatedOn()!=null||filters.getDates().getNewestCreatedOn() != null|| filters.getDates().getOldestFileDate() != null|| filters.getDates().getNewestFileDate() != null)){
                SQL =SQL + "AND";
            }
            //System.out.println("filters.getDates().getOldestCreatedOn() : " + filters.getDates().getOldestCreatedOn());
 if (filters.getDates().getOldestCreatedOn() != null){
             SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date parsedDate = dateFormat.parse(filters.getDates().getOldestCreatedOn().substring(0,10));
            Timestamp timestamp = new java.sql.Timestamp(parsedDate.getTime());
            //System.out.println("1 " + timestamp);
            SQL =SQL + " \"object2\".\"createdOn\" >=  \'"+timestamp+"\' ";
            if (filters.getDates().getNewestCreatedOn() != null|| filters.getDates().getOldestFileDate() != null|| filters.getDates().getNewestFileDate() != null){
                SQL =SQL + " AND ";
            }
        }
        if (filters.getDates().getNewestCreatedOn() != null){
             SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date parsedDate = dateFormat.parse(filters.getDates().getNewestCreatedOn().substring(0,10));
            Timestamp timestamp = new java.sql.Timestamp(parsedDate.getTime());
             
            //System.out.println("2  " + timestamp);
            SQL =SQL +" \"object2\".\"createdOn\" <= \'"+timestamp+"\' ";
             if ( filters.getDates().getOldestFileDate() != null|| filters.getDates().getNewestFileDate() != null){
                SQL =SQL + " AND ";
            }
        }
       
        if (filters.getDates().getOldestFileDate()!= null){
             SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date parsedDate = dateFormat.parse(filters.getDates().getOldestFileDate().substring(0,10));
            Timestamp timestamp = new java.sql.Timestamp(parsedDate.getTime());
             
            //System.out.println("3 " + timestamp);
            SQL =SQL +" \"document\".\"fileDate\" >=  \'"+timestamp+"\' ";
             if (  filters.getDates().getNewestFileDate() != null){
                SQL =SQL + " AND ";
            }
        }
        if (filters.getDates().getNewestFileDate() != null){
             SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date parsedDate = dateFormat.parse(filters.getDates().getNewestFileDate().substring(0,10));
            Timestamp timestamp = new java.sql.Timestamp(parsedDate.getTime());
             
            //System.out.println("4 " + timestamp);
            SQL =SQL +" \"document\".\"fileDate\" <=  \'"+timestamp+"\' ";
        }
        
        
//        if (!filters.getFilterQuery().equals("")){
//            ////System.out.println("FILTRO PALABRA: " + filters.getFilterQuery());
//            if(filters.getKeywords().size()>0 ||filters.getDates().getOldestCreatedOn() != null || filters.getDates().getNewestCreatedOn() != null|| filters.getDates().getOldestFileDate() != null|| filters.getDates().getNewestFileDate() != null){
//                SQL =SQL + " AND \"object2\".\"name\" LIKE '%"+filters.getFilterQuery()+"%'";
//            }
//            else{
//                SQL =SQL + " \"object\".\"name\" LIKE '%"+filters.getFilterQuery()+"%'";
//            }
//            
//           
//        }
        
       //System.out.println("SQL : " + SQL);
        if (!SQL.equals("")){
        DocumentDTO document = null;
             
          c = DataSourceSingleton.getInstance().getConnection(); 
         
        ps = c.prepareStatement(SQL);
        rs = ps.executeQuery();
        kFac = new KeywordFacade ();
        documents = new ArrayList<DocumentDTO> ();
         while (rs.next()) {
                       document = new DocumentDTO();
                       document.setId(rs.getInt("id"));
                       document.setCreatedBy(rs.getInt("createdBy"));
                        document.setIsFolder(rs.getBoolean("isFolder"));
                       document.setName(rs.getString("name"));
                       document.setDescription(rs.getString("description"));
                        
                        document.setCreatedOn(rs.getTimestamp("createdOn"));
                        document.setKind(rs.getString("kind"));
                        document.setFilename(rs.getString("filename"));
                        document.setFileDate(rs.getString("fileDate"));
                        document.setIdArea(rs.getInt("idArea"));
                        document.setKeywords(kFac.getKeywordsByDocument(document));
                         document.getArea().setName(rs.getString("nameArea"));
               document.getUser().setName(rs.getString("nameCreatedBy"));
                      documents.add(document);
                   }
            //System.out.println("documents size : " + documents.size());
         return documents;
        }
        else{
           // //System.out.println("regresando getDocuments");
            return getDocuments();
        }
      
     
    }
    catch (Exception e){
        e.printStackTrace();
    }
         finally{
             try{
                 if (rs != null){
                     rs.close();
                 }
                  if (c != null){
                     c.close();
                 }
                   if (ps != null){
                     ps.close();
                 }
                    
                
             }
             catch (Exception e2){
                 e2.printStackTrace();
             }
         }
        
        return documents;
    }
    
    public Boolean getVisible (int idArea, ArrayList<areaDTO> areas){
        for (areaDTO a : areas){
         if (a.getId() == idArea){
             return a.isUploadAndEdit();
         }   
        }
        return false;
    }
    
@Override
    public ArrayList<DocumentDTO> getDocumentsOnlyEnabled(ArrayList<areaDTO> areas) {
        kFac = new KeywordFacade ();
        ArrayList<DocumentDTO> documents = null;
        DocumentDTO document = null;
        ResultSet rs = null;
        Connection c = null;
        PreparedStatement ps = null;
       documents = new ArrayList<DocumentDTO> ();
         try{
               c = DataSourceSingleton.getInstance().getConnection(); 
               String SQL = "SELECT \"object\".\"id\", \"object\".\"createdBy\", \"object\".\"name\", \"object\".\"description\", \"object\".\"createdOn\", \"object\".\"createdBy\", \"object\".\"color\", \"object\".\"kind\", \"document\".\"fileName\", \"document\".\"fileDate\", \"document\".\"isFolder\", \"document\".\"idArea\", \"object2\".\"name\" AS \"nameCreatedBy\", \"object3\".\"name\" AS \"nameArea\", \"area\".\"enabled\", \"area\".\"enabled\" FROM \"document\" JOIN \"object\" ON \"document\".\"id\" = \"object\".\"id\" JOIN \"object\" AS \"object2\" ON \"object\".\"createdBy\" = \"object2\".\"id\" JOIN \"area\" ON \"document\".\"idArea\" = \"area\".\"id\" JOIN \"object\" AS \"object3\" ON \"area\".\"id\" = \"object3\".\"id\" WHERE   \"object\".\"id\" NOT IN (SELECT \"documentRelationships\".\"idDocumentChild\" FROM \"documentRelationships\") AND \"area\".\"enabled\" = TRUE AND  \"document\".\"deleted\" = FALSE ";
              if (areas.size()>0){
                 SQL = SQL + " AND ("; 
              }
               for (int a=0;a<areas.size();a++){
                 //  //System.out.println("area : " + areas.get(a).getName() + "  " + areas.get(a).isUploadAndEdit());
                  SQL = SQL + "\"document\".\"idArea\" = " + areas.get(a).getId();
                  if (!(a == areas.size()-1)){
                      SQL = SQL + " OR ";
                  }
                  else{
                      SQL = SQL + " ) ";
                  }
              }
               //System.out.println("SQL : " + SQL);
               ps = c.prepareStatement(SQL);
                 rs = ps.executeQuery();
                   while (rs.next()) {
                       document = new DocumentDTO();
                       document.setId(rs.getInt("id"));
                       document.setCreatedBy(rs.getInt("createdBy"));
                        document.setIsFolder(rs.getBoolean("isFolder"));
                       document.setName(rs.getString("name"));
                       document.setDescription(rs.getString("description"));
                        document.setColor(rs.getString("color"));
                        document.setCreatedOn(rs.getTimestamp("createdOn"));
                        document.setKind(rs.getString("kind"));
                        document.setFilename(rs.getString("filename"));
                        document.setKeywords(kFac.getKeywordsByDocument(document));
                    document.setFileDate(rs.getString("fileDate"));
                    document.setIdArea(rs.getInt("idArea"));
                         document.setVisible(getVisible(rs.getInt("idArea"), areas));
               document.getArea().setName(rs.getString("nameArea"));
               document.getUser().setName(rs.getString("nameCreatedBy"));
                      documents.add(document);
                   }
         }
         catch (Exception e){
             e.printStackTrace();
         }
         finally{
             try{
                 if (rs != null){
                     rs.close();
                 }
                  if (c != null){
                     c.close();
                 }
                   if (ps != null){
                     ps.close();
                 }
                    
                
             }
             catch (Exception e2){
                 e2.printStackTrace();
             }
         }
        return documents;}

    @Override
    public ArrayList<DocumentDTO> getDocumentsByUser(UsuarioDTO dto) {
       kFac = new KeywordFacade ();
        ArrayList<DocumentDTO> documents = null;
     DocumentDTO document = null;
        ResultSet rs = null;
        Connection c = null;
        PreparedStatement ps = null;
       documents = new ArrayList<DocumentDTO> ();
         try{
              c = DataSourceSingleton.getInstance().getConnection(); 
               String SQL = "SELECT \"object\".\"id\",\"object\".\"createdBy\", \"object\".\"name\", \"object\".\"description\", \"object\".\"createdOn\", \"object\".\"createdBy\", \"object\".\"color\", \"object\".\"kind\", \"document\".\"fileName\", \"document\".\"isFolder\", \"document\".\"deleted\", \"document\".\"fileDate\", \"document\".\"idArea\", \"object3\".\"name\" AS \"nameArea\", \"object2\".\"name\" AS \"nameCreatedBy\" FROM \"document\" JOIN \"object\" ON \"document\".\"id\" = \"object\".\"id\" JOIN \"object\" AS \"object3\" ON \"document\".\"idArea\" = \"object3\".\"id\" JOIN \"object\" AS \"object2\" ON \"object\".\"createdBy\" = \"object2\".\"id\" where \"object\".\"createdBy\" = ?  ORDER BY \"object\".\"createdOn\" ASC";
               ps = c.prepareStatement(SQL);
                   ps.setInt(1, dto.getId()); 
               rs = ps.executeQuery();
                   while (rs.next()) {
                       document = new DocumentDTO();
                       document.setId(rs.getInt("id"));
                       document.setCreatedBy(rs.getInt("createdBy"));
                        document.setIsFolder(rs.getBoolean("isFolder"));
                       document.setName(rs.getString("name"));
                       document.setDescription(rs.getString("description"));
                        document.setColor(rs.getString("color"));
                           document.setDeleted(rs.getBoolean("deleted"));
                        document.setCreatedOn(rs.getTimestamp("createdOn"));
                        document.setKind(rs.getString("kind"));
                        document.setFilename(rs.getString("filename"));
                        document.setKeywords(kFac.getKeywordsByDocument(document));
                    document.setFileDate(rs.getString("fileDate"));
                    document.setIdArea(rs.getInt("idArea"));
                   document.getArea().setName(rs.getString("nameArea"));
                   document.getUser().setName(rs.getString("nameCreatedBy"));
                      documents.add(document);
                   }
         }
         catch (Exception e){
             e.printStackTrace();
         }
         finally{
             try{
                 if (rs != null){
                     rs.close();
                 }
                  if (c != null){
                     c.close();
                 }
                   if (ps != null){
                     ps.close();
                 }
                    
                
             }
             catch (Exception e2){
                 e2.printStackTrace();
             }
         }
        return documents;}
    
    
    List <Boolean > ascendientes = null;
    String fullPath = "";
    String savingUp = "";
    public String getFullPath (DocumentDTO dto, String aSumar) throws UnsupportedEncodingException{
      aSumar = dto.getFilename();
        //System.out.println("a sumar: " + aSumar);
       if (aSumar.length()>savingUp.length()){
           savingUp = aSumar;
           //System.out.println("savingUp : " + savingUp);
       }
        //System.out.println(" dto.getId() : " + dto.getId() + " " + dto.getFilename());
     ////########## VERIFICAR SI TIENE PADRES
     DocumentDTO document = null;
       
        ResultSet rs = null;
        Connection c = null;
        PreparedStatement ps = null;
       
       try{
             c = DataSourceSingleton.getInstance().getConnection(); 
               String SQL = "SELECT \"documentRelationships\".\"idDocumentChild\", \"documentRelationships\".\"idDocumentParent\", \"document\".\"fileName\", \"document\".\"deleted\" FROM \"documentRelationships\" JOIN \"document\" ON \"documentRelationships\".\"idDocumentParent\" = \"document\".\"id\" WHERE \"documentRelationships\".\"idDocumentChild\" = ?";
               ps = c.prepareStatement(SQL);
               ps.setInt(1, dto.getId()); 
                   ps.setInt(1, dto.getId()); 
               rs = ps.executeQuery();

if (rs.next()) {
    do {
                       document = new DocumentDTO();
                   document.setId(rs.getInt("idDocumentParent"));
                   document.setFilename(rs.getString("fileName") + "/" +aSumar);
                   aSumar =rs.getString("fileName") + "/" +aSumar;
                  //System.out.println("rs.getBoolean(\"deleted\") : " + rs.getBoolean("deleted"));
                   ascendientes.add(rs.getBoolean("deleted"));
                   //System.out.println("document.getFilename() : " + document.getFilename());
                   getFullPath(document,document.getFilename());
    } while(rs.next());
} else {
    return aSumar;
}       



       }
       catch (Exception e){
             e.printStackTrace();
         }
         finally{
             try{
                 if (rs != null){
                     rs.close();
                 }
                  if (c != null){
                     c.close();
                 }
                   if (ps != null){
                     ps.close();
                 }
                    
                
             }
             catch (Exception e2){
                 e2.printStackTrace();
             }
         }
       //setFileName el aSumar
       ////########## VERIFICAR SI TIENE PADRES
       //System.out.println("a sumar antes de regresar: " + aSumar);
        return aSumar;
        
    }

    @Override
    public ArrayList<DocumentDTO> getDocumentsByFolder(DocumentDTO dto) {
        
        
     kFac = new KeywordFacade ();
        ArrayList<DocumentDTO> documents = null;
     DocumentDTO document = null;
       
        ResultSet rs = null;
        Connection c = null;
        PreparedStatement ps = null;
       documents = new ArrayList<DocumentDTO> ();
         try{
             c = DataSourceSingleton.getInstance().getConnection(); 
               String SQL = "SELECT \"document\".\"id\", \"document\".\"fileName\", \"document\".\"fileDate\", \"document\".\"idArea\", \"document\".\"deleted\", \"document\".\"backedUp\", \"document\".\"isFolder\", \"object\".\"name\", \"object\".\"description\", \"object\".\"createdOn\", \"object\".\"createdBy\", \"object\".\"kind\", \"documentRelationships\".\"idDocumentChild\", \"documentRelationships\".\"idDocumentParent\", \"object2\".\"name\" AS \"nameArea\", \"object3\".\"name\" AS \"nameCreatedBy\" FROM \"documentRelationships\" JOIN \"document\" ON \"documentRelationships\".\"idDocumentChild\" = \"document\".\"id\" JOIN \"object\" ON \"document\".\"id\" = \"object\".\"id\" JOIN \"area\" ON \"document\".\"idArea\" = \"area\".\"id\" JOIN \"object\" AS \"object2\" ON \"area\".\"id\" = \"object2\".\"id\" JOIN \"usuario\" ON \"object\".\"createdBy\" = \"usuario\".\"id\" JOIN \"object\" AS \"object3\" ON \"usuario\".\"id\" = \"object3\".\"id\" WHERE \"documentRelationships\".\"idDocumentParent\" = ?";
               ps = c.prepareStatement(SQL);
                ps.setInt(1, dto.getId()); 
                 rs = ps.executeQuery();
                   while (rs.next()) {
                       document = new DocumentDTO();
                       document.setIsFolder(rs.getBoolean("isFolder"));
                       document.setId(rs.getInt("id"));
                       document.setCreatedBy(rs.getInt("createdBy"));
                       document.setName(rs.getString("name"));
                       document.setDescription(rs.getString("description"));
                        document.setCreatedOn(rs.getTimestamp("createdOn"));
                        document.setKind(rs.getString("kind"));
                        document.setFilename(rs.getString("filename"));
                        document.setKeywords(kFac.getKeywordsByDocument(document));
                    document.setFileDate(rs.getString("fileDate"));
               document.setDeleted(rs.getBoolean("deleted"));
                    document.setIdArea(rs.getInt("idArea"));
                   document.getArea().setName(rs.getString("nameArea"));
                   document.getUser().setName(rs.getString("nameCreatedBy"));
                   document.setBackedUp(rs.getBoolean("backedUp"));
                   documents.add(document);
                   }
         }
         catch (Exception e){
             e.printStackTrace();
         }
         finally{
             try{
                 if (rs != null){
                     rs.close();
                 }
                  if (c != null){
                     c.close();
                 }
                   if (ps != null){
                     ps.close();
                 }
                    
                
             }
             catch (Exception e2){
                 e2.printStackTrace();
             }
         }
        return documents;}

  

    @Override
    public DocumentDTO createFolder(DocumentDTO document) {
        PropertiesFacade pDto = new PropertiesFacade();
       Boolean ascendienteBorrado = false;
       DocumentDTO dtoFolder = null;
    try {
        fullPath = getFullPath(document,document.getFilename());
    } catch (UnsupportedEncodingException ex) {
        Logger.getLogger(DocumentDAO.class.getName()).log(Level.SEVERE, null, ex);
    }
        if (document.getIdFolderPadre() != 0){
            ascendientes = new ArrayList<Boolean>();
            //System.out.println("Estamos hablando que esta dentro de una carpeta");
            dtoFolder = new DocumentDTO();
            dtoFolder.setId(document.getIdFolderPadre());
            DocumentFacade fac = new DocumentFacade();
            dtoFolder = fac.getDocument(dtoFolder);
            ascendientes.add(dtoFolder.getDeleted());
            
                //Para conseguir toda la liga de la garpeta
                dtoFolder.setFilename(dtoFolder.getFilename() + "/"+document.getFilename());
          
         
             savingUp = "";
            try {
                getFullPath(dtoFolder,dtoFolder.getFilename());
            } catch (UnsupportedEncodingException ex) {
                Logger.getLogger(DocumentDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
            fullPath = savingUp;
            
             for (Boolean b : ascendientes){
                 if (b){
                     ascendienteBorrado = true;
                 }
                }
        }
                
       
        areaFacade aFac = new areaFacade();
        areaDTO aDto = new areaDTO();
        aDto.setId(document.getIdArea());
        aDto = aFac.getAreaByID(aDto);
        String carpetaDestinoParaGrabar = "";
        //////////////////////////////////////////////////////
        if (ascendienteBorrado){
             carpetaDestinoParaGrabar = pDto.obtenerValorPropiedad("pathForTrash");
        }
        else{
              carpetaDestinoParaGrabar =  pDto.obtenerValorPropiedad("pathForFiles");
             }
          document.setFullPathToFolder( carpetaDestinoParaGrabar  + aDto.getFolderName() + "/"+fullPath);
         FilesFacade fFac = new FilesFacade();
         File files = new File(document.getFullPathToFolder());
         files = fFac.getUniqueFilename(files);
         document.setFullPathToFolder(files.getAbsolutePath());
    
        document.setFilename(FilenameUtils.getName(files.getAbsolutePath()));
//        if (fFac.verificaSiExiste(document.getFullPathToFolder())){
//             document.setFullPathToFolder(fFac.retornaNombreBienParaCarpeta(document.getFullPathToFolder())); ;
//          }
    
         
         files.mkdirs();
         ///////////
        ObjectFacade  oFac = new ObjectFacade();
         document.setId(oFac.createObject(document).getId()); 
      DocumentFacade dFac = new DocumentFacade();
       document =  dFac.createDocument(document);
        //System.out.println("document.getId() : " + document.getId());
     if (document.getIdFolderPadre() != 0){
       DocumentRelationshipFacade  drfac = new DocumentRelationshipFacade();
       DocumentRelationshipDTO dDto = new DocumentRelationshipDTO ();
       dDto.setIdDocumentChild(document.getId());
       dDto.setIdDocumentParent(dtoFolder.getId());
       drfac.createDocumentRelationship(dDto);
       }
       return document;
        
    }

    @Override
    public DocumentDTO createDocument2(DocumentDTO document) {
      
        PropertiesFacade pFac = new PropertiesFacade();
        fullPath = "";
        ascendientes  = new ArrayList <Boolean > ();
        Boolean ascendienteBorrado = false;
        savingUp = "";
    try {
        getFullPath(document,document.getFilename());
    } catch (UnsupportedEncodingException ex) {
        Logger.getLogger(DocumentDAO.class.getName()).log(Level.SEVERE, null, ex);
    }
         fullPath =savingUp;
         //System.out.println("fullPath archivo : " + fullPath);
         DocumentDTO dtoFolder = null;
          if (document.getIdFolderPadre() != 0){
             ascendientes = new ArrayList<Boolean>();
            dtoFolder = new DocumentDTO();
            dtoFolder.setId(document.getIdFolderPadre());
            DocumentFacade fac = new DocumentFacade();
            //Obtenemos info de la carpeta 
            dtoFolder = fac.getDocument(dtoFolder);
            ascendientes.add(dtoFolder.getDeleted());
         
                 dtoFolder.setFilename(dtoFolder.getFilename() + "/"+document.getFilename());
           
          
            savingUp = "";
             try {
                 getFullPath(dtoFolder,dtoFolder.getFilename());
             } catch (UnsupportedEncodingException ex) {
                 Logger.getLogger(DocumentDAO.class.getName()).log(Level.SEVERE, null, ex);
             }
            fullPath = savingUp;
            //System.out.println("fullPath : " + fullPath);
             for (Boolean b : ascendientes){
                 if (b){
                     ascendienteBorrado = true;
                 }
                }
             
             dtoFolder.setBackedUp(false);
             updateDocument(dtoFolder);
          }
        areaFacade aFac = new areaFacade();
          areaDTO aDto = new areaDTO();
          aDto.setId(document.getIdArea());
          aDto  = aFac.getAreaByID(aDto);
         File afile = null;
  
        afile = new File(pFac.obtenerValorPropiedad("pathForTemporaryFiles") + document.getFilename());
  
         String carpetaDestinoParaGrabar = "";
        //////////////////////////////////////////////////////
                if (ascendienteBorrado){
             carpetaDestinoParaGrabar = pFac.obtenerValorPropiedad("pathForTrash");
        }
        else{
              carpetaDestinoParaGrabar =  pFac.obtenerValorPropiedad("pathForFiles");
             }
         document.setFullPathToFolder( carpetaDestinoParaGrabar  + aDto.getFolderName()  + "/"+fullPath);
         //System.out.println("Documento final a querer grabar: " + document.getFullPathToFolder());
         FilesFacade fac = new FilesFacade();
         File f = fac.getUniqueFilename(new File(document.getFullPathToFolder()));
         //System.out.println("FINAL : " + f.getAbsolutePath());
         //System.out.println("JUST THE NAME: " + FilenameUtils.getName(f.getAbsolutePath()));
   
        document.setFilename(FilenameUtils.getName(f.getAbsolutePath()));
   
         document.setFullPathToFolder(f.getAbsolutePath());
         try{
         Files.createDirectories(Paths.get(document.getFullPathToFolder()).getParent()); 
         Files.move(Paths.get(afile.getAbsolutePath()), Paths.get(document.getFullPathToFolder()));
         
         ObjectFacade  oFac = new ObjectFacade();
         document.setId(oFac.createObject(document).getId()); 
      DocumentFacade dFac = new DocumentFacade();
       document =  dFac.createDocument(document);
if (document.getIdFolderPadre()!= 0){
       DocumentRelationshipFacade  drfac = new DocumentRelationshipFacade();
       DocumentRelationshipDTO dDto = new DocumentRelationshipDTO ();
       dDto.setIdDocumentChild(document.getId());
       dDto.setIdDocumentParent(dtoFolder.getId());
       drfac.createDocumentRelationship(dDto);
       }
            FilesFacade fFac = new FilesFacade();
           fFac.borrarCarpetaTemporales();
        return document;
        
         }
         catch (Exception e) {
             e.printStackTrace();
         }
        
        
         /*
         afile.renameTo(new File(document.getFullPathToFolder()));
        
         ObjectFacade  oFac = new ObjectFacade();
         document.setId(oFac.createObject(document).getId()); 
      DocumentFacade dFac = new DocumentFacade();
       document =  dFac.createDocument(document);
if (document.getFolder().getId() != 0){
       DocumentRelationshipFacade  drfac = new DocumentRelationshipFacade();
       DocumentRelationshipDTO dDto = new DocumentRelationshipDTO ();
       dDto.setIdDocumentChild(document.getId());
       dDto.setIdDocumentParent(dtoFolder.getId());
       drfac.createDocumentRelationship(dDto);
       }
        return document;*/
         return null;
    }

    
    //Donde ese documento no sea dude
    @Override
    public ArrayList<DocumentDTO> getFolders( FilterForGovernmentDTO dto  ) {
         ascendientes = new ArrayList<Boolean>();
        ArrayList<DocumentDTO> documents = null;
     DocumentDTO document = null;
       
        ResultSet rs = null;
        Connection c = null;
        PreparedStatement ps = null;
           PropertiesFacade pFac = null;
       documents = new ArrayList<DocumentDTO> ();
         try {
          c = DataSourceSingleton.getInstance().getConnection(); 
           String SQL = "SELECT \"document\".\"id\", \"document\".\"fileName\", \"document\".\"idArea\", \"document\".\"deleted\", \"document\".\"isFolder\", \"area\".\"folderName\" FROM \"document\" JOIN \"area\" ON \"document\".\"idArea\" = \"area\".\"id\" WHERE \"document\".\"isFolder\" = TRUE AND \"document\".\"id\" NOT IN( SELECT \"documentRelationships\".\"idDocumentChild\" FROM \"documentRelationships\") and \"document\".\"id\" != ?";
             if (dto.getAreas().size()>0){
                 SQL = SQL + " AND ("; 
              }
               for (int a=0;a<dto.getAreas().size();a++){
                 //  //System.out.println("area : " + areas.get(a).getName() + "  " + areas.get(a).isUploadAndEdit());
                  SQL = SQL + "\"document\".\"idArea\" = " + dto.getAreas().get(a).getId();
                  if (!(a == dto.getAreas().size()-1)){
                      SQL = SQL + " OR ";
                  }
                  else{
                      SQL = SQL + " ) ";
                  }
              }  
           
           
           ps = c.prepareStatement(SQL);
               ps.setInt(1, dto.getDocument().getId());
                 rs = ps.executeQuery();
                   while (rs.next()) {
                       document = new DocumentDTO();
                       document.setIsFolder(rs.getBoolean("isFolder"));
                       document.setId(rs.getInt("id"));
                       document.setVengoDeRootYPuedoCambiarDeArea(true);
                        document.setFilename(rs.getString("fileName"));
               document.setDeleted(rs.getBoolean("deleted"));
               document.setAscendenteBorrado(rs.getBoolean("deleted"));
                    document.setIdArea(rs.getInt("idArea"));
                   document.getArea().setFolderName(rs.getString("folderName"));
                    String fullPathOriginal = "";
                  pFac = new PropertiesFacade();
                        String pathTrash = pFac.obtenerValorPropiedad("pathForTrash");
                        fullPathOriginal =  pFac.obtenerValorPropiedad("pathForFiles");
                    //System.out.println("#######################");
                        savingUp = "";
                        getFullPath(document,document.getFilename());
                        String fp = savingUp;
                        document.setName(fp);
                        //System.out.println("ascendientes : " + ascendientes.size());
                        for(Boolean b : ascendientes){
                            if (b){
                                document.setAscendenteBorrado(true);
                                break;
                            }
                        }
                        
                       //System.out.println("FP : " + fp);
                       //System.out.println("#######################");
                    document.setFullPathToFolder( fp);
                    document.setFullPathToFolderInDeleted(fp);
                    //System.out.println("setFullPathToFolder : " + document.getFullPathToFolder());
                     //System.out.println("setFullPathToFolderInDeleted : " + document.getFullPathToFolderInDeleted());
                      documents.add(document);
                   }
         }
         catch (Exception e){
             e.printStackTrace();
         }
         finally{
             try{
                 if (rs != null){
                     rs.close();
                 }
                  if (c != null){
                     c.close();
                 }
                   if (ps != null){
                     ps.close();
                 }
                   
                    
                
             }
             catch (Exception e2){
                 e2.printStackTrace();
             }
         }
        return documents;
    }

    
    
    @Override
    public DocumentGovernmentDTO getDocumentGovernment( FilterForGovernmentDTO dto ) {
        //System.out.println("dto.getDocument().getIdFolderPadre() : "+ dto.getDocument().getIdFolderPadre());
        if (dto.getDocument().getIsFolder() && dto.getDocument().getIdFolderPadre()!= 0){
           dto.getDocument().setId(dto.getDocument().getIdFolderPadre());
        }
//          if (dto.getDocument().getIsFolder()){
//           dto.getDocument().setId(dto.getDocument().getIdFolderPadre());
//        }
        DocumentGovernmentDTO dgDto = new DocumentGovernmentDTO();
        ArrayList<DocumentDTO> foldersRoot= new ArrayList<DocumentDTO>();
        foldersRoot = getFolders(dto);
        
        for (DocumentDTO doc :foldersRoot){
            
            doc.setChildren(getFoldersChildren (doc,dto));
        }
        dgDto.setChildren(foldersRoot);
        return dgDto;
    }

    @Override
    public ArrayList<DocumentDTO> getFoldersChildren(DocumentDTO dto,FilterForGovernmentDTO fDto) {
      
        ArrayList<DocumentDTO> documents = null;
     DocumentDTO document = null;
       
        ResultSet rs = null;
        Connection c = null;
        PreparedStatement ps = null;
           PropertiesFacade pFac = null;
       documents = new ArrayList<DocumentDTO> ();
         try {
          c = DataSourceSingleton.getInstance().getConnection(); 
           String SQL = "SELECT \"document\".\"fileName\", \"document\".\"id\",\"document\".\"idArea\" FROM \"documentRelationships\" JOIN \"document\" ON \"documentRelationships\".\"idDocumentChild\" = \"document\".\"id\" WHERE \"document\".\"isFolder\" = TRUE AND \"documentRelationships\".\"idDocumentParent\" = ?   AND \"documentRelationships\".\"idDocumentChild\" != ? ";
           if (fDto.getAreas().size()>0){
                 SQL = SQL + " AND ("; 
              }
               for (int a=0;a<fDto.getAreas().size();a++){
                 //  //System.out.println("area : " + areas.get(a).getName() + "  " + areas.get(a).isUploadAndEdit());
                  SQL = SQL + "\"document\".\"idArea\" = " + fDto.getAreas().get(a).getId();
                  if (!(a == fDto.getAreas().size()-1)){
                      SQL = SQL + " OR ";
                  }
                  else{
                      SQL = SQL + " ) ";
                  }
              }    
           
           ps = c.prepareStatement(SQL);
               ps.setInt(1, dto.getId());
               ps.setInt(2, fDto.getDocument().getId());
                 rs = ps.executeQuery();
                   while (rs.next()) {
                       
                       document = new DocumentDTO();
                       
                       document.setId(rs.getInt("id"));
                       document.setIdArea(rs.getInt("idArea"));
                       document.setName(rs.getString("fileName"));
                        document.setFilename(rs.getString("fileName"));
                       documents.add(document);
                   }
         }
         catch (Exception e){
             e.printStackTrace();
         }
         finally{
             try{
                 if (rs != null){
                     rs.close();
                 }
                  if (c != null){
                     c.close();
                 }
                   if (ps != null){
                     ps.close();
                 }
                   
                    
                
             }
             catch (Exception e2){
                 e2.printStackTrace();
             }
         }
         for (DocumentDTO doc :documents){
            doc.setChildren(getFoldersChildren (doc,fDto));
        }
        return documents;}

    @Override
    public String moveDocuments(ArrayList<DocumentDTO> documents) {
        
    try {
        //No esta agarrando bien el origen
        if (!verificaSiEsDescendiente(documents)){
            
            
        DocumentFacade doFac = new DocumentFacade(); 
        DocumentDTO documentoOriginal = new DocumentDTO();
        DocumentDTO documentoDestino = new DocumentDTO();
            try {
                BeanUtils.copyProperties(documentoOriginal, documents.get(0));
                BeanUtils.copyProperties(documentoDestino,  documents.get(1));  
            } catch (IllegalAccessException ex) {
                Logger.getLogger(DocumentDAO.class.getName()).log(Level.SEVERE, null, ex);
            } catch (InvocationTargetException ex) {
                Logger.getLogger(DocumentDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        
            
          
          ///////////////////////////////////
          documentoOriginal = doFac.getDocument(documentoOriginal);
          //System.out.println("documentoOriginal : " + documentoOriginal.getFullPathToFolder());
            //System.out.println("documentoOriginal : " + documentoOriginal.getFullPathToFolderInDeleted());
          //////////////////////////////////
          DocumentRelationshipDTO drDto = new DocumentRelationshipDTO ();
          drDto.setIdDocumentChild(documentoOriginal.getId());
          DocumentRelationshipFacade fac = new DocumentRelationshipFacade();
          fac.deleteDocumentRelationship(drDto);
         ///////////////////////////////////
if (documentoDestino.getId() == documentoOriginal.getId()){
    return null;
}
          if (documentoDestino.getId() != 1){
             
            try {  
                BeanUtils.copyProperties(documentoDestino,  doFac.getDocument(documentoDestino));
            } catch (IllegalAccessException ex) {
                Logger.getLogger(DocumentDAO.class.getName()).log(Level.SEVERE, null, ex);
            } catch (InvocationTargetException ex) {
                Logger.getLogger(DocumentDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
              if (documentoOriginal.getIdArea()!= documentoDestino.getIdArea() ){
               
                  documentoOriginal.setIdArea(documentoDestino.getIdArea());
                  if (documentoOriginal.getIsFolder()){
                  getAllDescendants(documentoOriginal);    
                  }
                  
                  doFac.updateDocument2ParaMove(documentoOriginal);
                  
              }
              
          drDto = new DocumentRelationshipDTO ();
          drDto.setIdDocumentChild(documentoOriginal.getId());
          drDto.setIdDocumentParent(documentoDestino.getId());
          fac.createDocumentRelationship(drDto);
          }
          else{
             
              PropertiesFacade pDto = new PropertiesFacade();
                String pathTrash = pDto.obtenerValorPropiedad("pathForTrash");
                String fullPathOriginal =  pDto.obtenerValorPropiedad("pathForFiles");
                
              documentoDestino.setFullPathToFolder(fullPathOriginal+documentoOriginal.getArea().getFolderName());
              documentoDestino.setFullPathToFolderInDeleted(pathTrash+documentoOriginal.getArea().getFolderName());
              
          }
          
          String pathOrigen="";
          String pathDestino="";
          
          if (documentoOriginal.getAscendenteBorrado()){
            pathOrigen = documentoOriginal.getFullPathToFolderInDeleted();
          }
          else{
              pathOrigen = documentoOriginal.getFullPathToFolder();
          }
          
          //Si el documento origen esta borrado...
          //checar si es necesario que los de documento original
            if (documentoDestino.getAscendenteBorrado() || documentoOriginal.getDeleted() ){
                 pathDestino = documentoDestino.getFullPathToFolderInDeleted() + "/" + documentoOriginal.getFilename() ;
               
              }
              else{
                pathDestino = documentoDestino.getFullPathToFolder()  + "/" + documentoOriginal.getFilename();
                 
              }
            FilesFacade fFac = new FilesFacade();
             if (fFac.verificaSiExiste(pathDestino)){
                    File f = fFac.getUniqueFilename(new File(pathDestino));
                    pathDestino =   f.getAbsolutePath();
              String nuevoFileName = pathDestino.substring(pathDestino.lastIndexOf("/")+1, pathDestino.length());
              documentoOriginal.setFilename(nuevoFileName);
              doFac.updateDocumentFilename(documentoOriginal);
          }
            
       Files.createDirectories(Paths.get(pathDestino).getParent());
        Files.move(Paths.get(pathOrigen), Paths.get(pathDestino));
              documentoDestino.setBackedUp(false);
              doFac.updateDocument2ParaMove(documentoDestino);
             return "success";
        }
        
        
           } 
    catch (Exception ex) {
        ex.printStackTrace();
    }
        //System.out.println("Error");
    return "error1";
    }

   

    @Override
    public Boolean verificaSiEsDescendiente(ArrayList<DocumentDTO> documents) {
   
        
     DocumentDTO document = null;
        DocumentDTO d0 = null;
        DocumentDTO d1 = null;
    try {
          d0 = new DocumentDTO(); ;
        d1 = new DocumentDTO();
        BeanUtils.copyProperties(d0, documents.get(0));
         BeanUtils.copyProperties(d1, documents.get(1));
    } catch (IllegalAccessException ex) {
        Logger.getLogger(DocumentDAO.class.getName()).log(Level.SEVERE, null, ex);
    } catch (InvocationTargetException ex) {
        Logger.getLogger(DocumentDAO.class.getName()).log(Level.SEVERE, null, ex);
    }
      
        ResultSet rs = null;
        Connection c = null;
        PreparedStatement ps = null;
           PropertiesFacade pFac = null;
       
         try {
          c = DataSourceSingleton.getInstance().getConnection(); 
           String SQL = "SELECT \"document\".\"fileName\", \"document\".\"id\" FROM \"documentRelationships\" JOIN \"document\" ON \"documentRelationships\".\"idDocumentChild\" = \"document\".\"id\" WHERE \"document\".\"isFolder\" = TRUE AND \"documentRelationships\".\"idDocumentParent\" = ?";
              
           
           ps = c.prepareStatement(SQL);
               ps.setInt(1, d0.getId());
               //ps.setInt(2, dto.getDocument().getId());
                 rs = ps.executeQuery();
                   while (rs.next()) {
                       if (rs.getInt("id") == d1.getId()){
                           //System.out.println("Es descendiente");
                           return true;
                       }
                       
                   }
         }
         catch (Exception e){
             e.printStackTrace();
         }
         finally{
             try{
                 if (rs != null){
                     rs.close();
                 }
                  if (c != null){
                     c.close();
                 }
                   if (ps != null){
                     ps.close();
                 }
                   
                    
                
             }
             catch (Exception e2){
                 e2.printStackTrace();
             }
         }

        return false; }

    @Override
    public DocumentDTO updateDocument2ParaMove(DocumentDTO dDto) {
        
        DocumentDTO dtoViejo = getDocument(dDto);
            DocumentDTO objectDto = null;
        ResultSet rs = null;
        Connection c = null;
        PreparedStatement preparedStmt = null;
     
          try {
          c = DataSourceSingleton.getInstance().getConnection(); 
            String SQL = "update \"public\".\"document\" set \"deleted\"=?,\"backedUp\"=?,\"idArea\"=? where \"id\"=? ";
                preparedStmt = c.prepareStatement(SQL);
         
            preparedStmt.setBoolean(1, dDto.getDeleted());
            preparedStmt.setBoolean(2, dDto.getBackedUp());
            preparedStmt.setInt(3, dDto.getIdArea());
            preparedStmt.setInt(4, dDto.getId());
                preparedStmt.executeUpdate();
                if (dtoViejo != null && dDto!= null){
                if ((dtoViejo.getIdArea() != dDto.getIdArea()) && (dDto.getVengoDeRootYPuedoCambiarDeArea())){
                     DocumentDTO dtoNuevo = getDocument(dDto);
                     if (dDto.getDeleted()){
                          Files.createDirectories(Paths.get(dtoNuevo.getFullPathToFolderInDeleted()).getParent()); 
                            Files.move(Paths.get(dtoViejo.getFullPathToFolderInDeleted()), Paths.get(dtoNuevo.getFullPathToFolderInDeleted()));
                             }
                     else{
                         Files.createDirectories(Paths.get(dtoNuevo.getFullPathToFolder()).getParent()); 
                         Files.move(Paths.get(dtoViejo.getFullPathToFolder()), Paths.get(dtoNuevo.getFullPathToFolder()));
                        }
                      }
                  }
              /* if (!dDto.getBackedUp()){
             TransactionRecordFacade tFac = new TransactionRecordFacade();
             TransactionRecordDTO tDto = new TransactionRecordDTO();
             tDto.getObjectDTO().setId(dDto.getId());
             tDto.getTransactionTypeDTO().setId(4);
             tDto.getUsuarioDTO().setId(dDto.getCreatedBy());
             tFac.createTransactionRecord(tDto);
               }
   */
               
              
    }
         catch (Exception e){
             e.printStackTrace();
         }
         finally{
             try{
                 if (rs != null){
                     rs.close();
                 }
                  if (c != null){
                     c.close();
                 }
                   if (preparedStmt != null){
                     preparedStmt.close();
                 }
                    
                
             }
             catch (Exception e2){
                 e2.printStackTrace();
             }
         
         }
         return dDto;
    }

    
    
    @Override
    public ArrayList<DocumentDTO> getAllDescendants(DocumentDTO dto) {
       
       

        ResultSet rs = null;
        Connection c = null;
        PreparedStatement ps = null;
       DocumentDTO newDto = null;
       
         try{
              c = DataSourceSingleton.getInstance().getConnection(); 
                String SQL = "SELECT \"documentRelationships\".\"idDocumentChild\" FROM \"documentRelationships\" WHERE \"documentRelationships\".\"idDocumentParent\" = ?";
                ps = c.prepareStatement(SQL);
               ps.setInt(1, dto.getId());
                 rs = ps.executeQuery();
                   while (rs.next()) {
                       newDto = new DocumentDTO();
                       newDto.setId(rs.getInt("idDocumentChild"));
                       newDto.setIdArea(dto.getIdArea());
                       updateDocumentArea(newDto);
                       getAllDescendants(newDto);
                   }
         }
         catch (Exception e){
             e.printStackTrace();
         }
         finally{
             try{
                 if (rs != null){
                     rs.close();
                 }
                  if (c != null){
                     c.close();
                 }
                   if (ps != null){
                     ps.close();
                 }
             }
             catch (Exception e2){
                 e2.printStackTrace();
             }
         }
        
        return null; 
        
    }

    
     @Override
    public DocumentDTO updateDocumentArea(DocumentDTO dDto) {
    
        
        //System.out.println("dDto.getDeleted() : " + dDto.getDeleted());
        DocumentDTO dtoViejo = getDocument(dDto);
        
            DocumentDTO objectDto = null;
               
     
        ResultSet rs = null;
        Connection c = null;
        PreparedStatement preparedStmt = null;
     
          try {
          c = DataSourceSingleton.getInstance().getConnection(); 
            String SQL = "update \"public\".\"document\" set \"idArea\"=? where \"id\"=? ";
                preparedStmt = c.prepareStatement(SQL);
            preparedStmt.setInt(1, dDto.getIdArea());
            preparedStmt.setInt(2, dDto.getId());
                preparedStmt.executeUpdate();
    }
         catch (Exception e){
             e.printStackTrace();
         }
         finally{
             try{
                 if (rs != null){
                     rs.close();
                 }
                  if (c != null){
                     c.close();
                 }
                   if (preparedStmt != null){
                     preparedStmt.close();
                 }
                    
                
             }
             catch (Exception e2){
                 e2.printStackTrace();
             }
         
         }
         return dDto;}
    
    @Override
    public DocumentDTO updateDocumentDeleted(DocumentDTO dDto) {
    
        
        //System.out.println("dDto.getDeleted() : " + dDto.getDeleted());
        DocumentDTO dtoViejo = getDocument(dDto);
        
            DocumentDTO objectDto = null;
               
     
        ResultSet rs = null;
        Connection c = null;
        PreparedStatement preparedStmt = null;
     
          try {
          c = DataSourceSingleton.getInstance().getConnection(); 
            String SQL = "update \"public\".\"document\" set \"deleted\"=? where \"id\"=? ";
                preparedStmt = c.prepareStatement(SQL);
            preparedStmt.setBoolean(1, dDto.getDeleted());
            preparedStmt.setInt(2, dDto.getId());
                preparedStmt.executeUpdate();
    }
         catch (Exception e){
             e.printStackTrace();
         }
         finally{
             try{
                 if (rs != null){
                     rs.close();
                 }
                  if (c != null){
                     c.close();
                 }
                   if (preparedStmt != null){
                     preparedStmt.close();
                 }
                    
                
             }
             catch (Exception e2){
                 e2.printStackTrace();
             }
         
         }
         return dDto;}

    @Override
    public DocumentDTO updateDocumentFilename(DocumentDTO dDto) {
   
        
        DocumentDTO dtoViejo = getDocument(dDto);
        
            DocumentDTO objectDto = null;
               
     
        ResultSet rs = null;
        Connection c = null;
        PreparedStatement preparedStmt = null;
     
          try {
          c = DataSourceSingleton.getInstance().getConnection(); 
            String SQL = "update \"public\".\"document\" set \"fileName\"=? where \"id\"=? ";
                preparedStmt = c.prepareStatement(SQL);
            preparedStmt.setString(1, dDto.getFilename());
            preparedStmt.setInt(2, dDto.getId());
                preparedStmt.executeUpdate();
    }
         catch (Exception e){
             e.printStackTrace();
         }
         finally{
             try{
                 if (rs != null){
                     rs.close();
                 }
                  if (c != null){
                     c.close();
                 }
                   if (preparedStmt != null){
                     preparedStmt.close();
                 }
                    
                
             }
             catch (Exception e2){
                 e2.printStackTrace();
             }
         
         }
         return dDto; }

    @Override
    public DocumentDTO deleteDocument2(DocumentDTO dDto) {
          try {  PropertiesFacade fac = new PropertiesFacade();
        dDto = getDocument(dDto);
        File file = new File (dDto.getFullPathToFolder());
         String destino ="";
        if (dDto.getIsFolder() && file.isDirectory()){
            getAllDescendantsAndCopy(dDto);
             destino = fac.obtenerValorPropiedad("pathForTrash")  + dDto.getFilename();
                  Files.move(Paths.get(dDto.getFullPathToFolder()), Paths.get(destino));
               File f1 = new  File (destino);
               File f2= new  File ( fac.obtenerValorPropiedad("pathForTrash")  + dDto.getId());
              boolean success = f1.renameTo(f2);
               dDto.setDeleted(true);
        updateDocumentDeleted(dDto);
 //getAllDescendantsAndDelete(dDto);
        }
        else{
           
                String baseName = FilenameUtils.getBaseName( file.getName() );
                String extension = FilenameUtils.getExtension( file.getName() );
                destino = fac.obtenerValorPropiedad("pathForTrash") + dDto.getId() +"."+ extension;
                
                 Files.move(Paths.get(dDto.getFullPathToFolder()), Paths.get(fac.obtenerValorPropiedad("pathForTrash") + dDto.getFilename()));
                
                 File f1 = new  File (fac.obtenerValorPropiedad("pathForTrash") + dDto.getFilename());
                  File f2= new  File (destino);
                   boolean success = f1.renameTo(f2);
                    dDto.setDeleted(true);
        updateDocumentDeleted(dDto);
                  
        }
       
    } catch (IOException ex) {
        Logger.getLogger(DocumentDAO.class.getName()).log(Level.SEVERE, null, ex);
    }
         
        return dDto;
    }

    @Override
    public DocumentDTO restoreDocument2(DocumentDTO dDto) {
        PropertiesFacade fac = new PropertiesFacade();
        dDto = getDocument(dDto);
//          String baseName = FilenameUtils.getBaseName( file.getName() );
//                String extension = FilenameUtils.getExtension( file.getName() );
        if (dDto.isFolder){
            File file = new File (fac.obtenerValorPropiedad("pathForTrash") +dDto.getId() );
      try {
                Files.move(Paths.get(file.getAbsolutePath()), Paths.get(dDto.getFullPathToFolder()));
            
            } catch (IOException ex) {
                Logger.getLogger(DocumentDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        else{
            
            String extension =  dDto.getFilename().substring(dDto.getFilename().lastIndexOf("."), dDto.getFilename().length());
            File file = new File (fac.obtenerValorPropiedad("pathForTrash") +dDto.getId() +  extension);
         
            try {
                Files.move(Paths.get(file.getAbsolutePath()), Paths.get(dDto.getFullPathToFolder()));
            
            } catch (IOException ex) {
                Logger.getLogger(DocumentDAO.class.getName()).log(Level.SEVERE, null, ex);
            }
                
            }
        
         dDto.setDeleted(false);
        updateDocumentDeleted(dDto);
        
        
       return dDto;
    }

    
    //Copia a basura
    @Override
    public ArrayList<DocumentDTO> getAllDescendantsAndCopy(DocumentDTO dto) {
    
       
       

        ResultSet rs = null;
        Connection c = null;
        PreparedStatement ps = null;
       DocumentDTO newDto = null;
       
         try{
              c = DataSourceSingleton.getInstance().getConnection(); 
                String SQL = "SELECT \"documentRelationships\".\"idDocumentChild\" FROM \"documentRelationships\" WHERE \"documentRelationships\".\"idDocumentParent\" = ?";
                ps = c.prepareStatement(SQL);
               ps.setInt(1, dto.getId());
                 rs = ps.executeQuery();
                   while (rs.next()) {
                       newDto = new DocumentDTO();
                       newDto.setId(rs.getInt("idDocumentChild"));
                       newDto = getDocument(newDto);
                       copyDocumentToTrash(newDto);
                       newDto.setDeleted(true);
                       updateDocumentDeleted(newDto);
                       getAllDescendants(newDto);
                   }
         }
         catch (Exception e){
             e.printStackTrace();
         }
         finally{
             try{
                 if (rs != null){
                     rs.close();
                 }
                  if (c != null){
                     c.close();
                 }
                   if (ps != null){
                     ps.close();
                 }
             }
             catch (Exception e2){
                 e2.printStackTrace();
             }
         }
        
        return null;  }

    @Override
    public ArrayList<DocumentDTO> getAllDescendantsAndDelete(DocumentDTO dto) {
   
       
       

        ResultSet rs = null;
        Connection c = null;
        PreparedStatement ps = null;
       DocumentDTO newDto = null;
       
         try{
              c = DataSourceSingleton.getInstance().getConnection(); 
                String SQL = "SELECT \"documentRelationships\".\"idDocumentChild\" FROM \"documentRelationships\" WHERE \"documentRelationships\".\"idDocumentParent\" = ?";
                ps = c.prepareStatement(SQL);
               ps.setInt(1, dto.getId());
                 rs = ps.executeQuery();
                   while (rs.next()) {
                       newDto = new DocumentDTO();
                       newDto.setId(rs.getInt("idDocumentChild"));
                        newDto = getDocument(newDto);
                       deleteDocumentFromSource(newDto);
                      // getAllDescendants(newDto);
                   }
         }
         catch (Exception e){
             e.printStackTrace();
         }
         finally{
             try{
                 if (rs != null){
                     rs.close();
                 }
                  if (c != null){
                     c.close();
                 }
                   if (ps != null){
                     ps.close();
                 }
             }
             catch (Exception e2){
                 e2.printStackTrace();
             }
         }
        
        return null;   }

    @Override
    public DocumentDTO copyDocumentToTrash(DocumentDTO dDto) {
           try {  PropertiesFacade fac = new PropertiesFacade();
        
        File file = new File (dDto.getFullPathToFolder());
         String destino ="";
        if (dDto.getIsFolder() && file.isDirectory()){
             destino = fac.obtenerValorPropiedad("pathForTrash")  + dDto.getFilename();
                  Files.copy(Paths.get(dDto.getFullPathToFolder()), Paths.get(destino));
               File f1 = new  File (destino);
               File f2= new  File ( fac.obtenerValorPropiedad("pathForTrash")  + dDto.getId());
              boolean success = f1.renameTo(f2);
        }
        else{
           
                String baseName = FilenameUtils.getBaseName( file.getName() );
                String extension = FilenameUtils.getExtension( file.getName() );
                destino = fac.obtenerValorPropiedad("pathForTrash") + dDto.getId() +"."+ extension;
                
                 Files.copy(Paths.get(dDto.getFullPathToFolder()), Paths.get(fac.obtenerValorPropiedad("pathForTrash") + dDto.getFilename()));
                
                 File f1 = new  File (fac.obtenerValorPropiedad("pathForTrash") + dDto.getFilename());
                  File f2= new  File (destino);
                   boolean success = f1.renameTo(f2);
                    
                  
        }
       
    } catch (IOException ex) {
        Logger.getLogger(DocumentDAO.class.getName()).log(Level.SEVERE, null, ex);
    }
        return null;
    }

    @Override
    public DocumentDTO deleteDocumentFromSource(DocumentDTO dDto) {
      PropertiesFacade fac = new PropertiesFacade();
        
        File file = new File (dDto.getFullPathToFolder());
        file.delete();
        return null; }
    
}
