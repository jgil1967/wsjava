/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.uas.document;

import com.uas.areas.areaDTO;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author jonathangil
 */
public class FilterForGovernmentDTO {
    DocumentDTO document;
    List <areaDTO> areas;

    
    public FilterForGovernmentDTO() {
        document =  new  DocumentDTO();
        areas = new ArrayList <areaDTO> ();
    }

    public DocumentDTO getDocument() {
        return document;
    }

    public void setDocument(DocumentDTO document) {
        this.document = document;
    }

    public List<areaDTO> getAreas() {
        return areas;
    }

    public void setAreas(List<areaDTO> areas) {
        this.areas = areas;
    }
    
}
