/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.uas.documentRelationship;

import java.util.ArrayList;

/**
 *
 * @author jonathangil
 */
public interface DocumentRelationshipInterface {
    DocumentRelationshipDTO createDocumentRelationship (DocumentRelationshipDTO dto);
     DocumentRelationshipDTO deleteDocumentRelationship (DocumentRelationshipDTO dto);
     ArrayList<DocumentRelationshipDTO> getChildren (DocumentRelationshipDTO dto);
}
