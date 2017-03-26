/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.uas.documentRelationship;


import com.uas.dbutil.DataSourceSingleton;
import com.uas.dbutil.getTomcatDataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author jonathangil
 */
public class DocumentRelationshipDAO implements DocumentRelationshipInterface{

    @Override
    public DocumentRelationshipDTO createDocumentRelationship(DocumentRelationshipDTO dto) {
      PreparedStatement preparedStmt = null;
        Connection c = null;
        ResultSet rs =null;
        
                 
         try {
       c = DataSourceSingleton.getInstance().getConnection(); 
          String SQL = "INSERT INTO \"public\".\"documentRelationships\" (\"idDocumentParent\",\"idDocumentChild\") VALUES (?,?)";
     	preparedStmt = c.prepareStatement(SQL);
         
         preparedStmt.setInt(1, dto.getIdDocumentParent());
         preparedStmt.setInt(2, dto.getIdDocumentChild());
         
             preparedStmt.executeUpdate();
//              TransactionRecordFacade tFac = new TransactionRecordFacade();
//             TransactionRecordDTO tDto = new TransactionRecordDTO();
//             tDto.getObjectDTO().setId(dDto.getId());
//             tDto.getTransactionTypeDTO().setId(5);
//             tDto.getUsuarioDTO().setId(dDto.getCreatedBy());
//             tFac.createTransactionRecord(tDto);
         
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
    return dto;}

    @Override
    public DocumentRelationshipDTO deleteDocumentRelationship(DocumentRelationshipDTO dto) {
         PreparedStatement preparedStmt = null;
        Connection c = null;
        ResultSet rs =null;
        
                 
         try {
       c = DataSourceSingleton.getInstance().getConnection(); 
          String SQL = "delete from \"public\".\"documentRelationships\" where  \"idDocumentChild\"=? ";
     	preparedStmt = c.prepareStatement(SQL);
         
         
         preparedStmt.setInt(1, dto.getIdDocumentChild());
         
             preparedStmt.executeUpdate();
         
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
    return dto;
    }

    @Override
    public ArrayList<DocumentRelationshipDTO> getChildren(DocumentRelationshipDTO dto) {
     ArrayList<DocumentRelationshipDTO> list = null;
        ResultSet rs = null;
        Connection c = null;
        PreparedStatement ps = null;
       list = new ArrayList<DocumentRelationshipDTO> ();
       DocumentRelationshipDTO newDto = null;
         try{
              c = DataSourceSingleton.getInstance().getConnection(); 
                String SQL = "SELECT \"documentRelationships\".\"idDocumentChild\" FROM \"documentRelationships\" WHERE \"documentRelationships\".\"idDocumentParent\" = ?";
                ps = c.prepareStatement(SQL);
               ps.setInt(1, dto.getIdDocumentParent());
                 rs = ps.executeQuery();
                   while (rs.next()) {
                       newDto = new DocumentRelationshipDTO();
                       newDto.setIdDocumentChild(rs.getInt("idDocumentChild"));
                       list.add(newDto);
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

    
}
