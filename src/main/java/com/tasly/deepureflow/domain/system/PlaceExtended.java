package com.tasly.deepureflow.domain.system;

import java.io.Serializable;
import java.util.List;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name = "PlaceExtended")
public class PlaceExtended implements Serializable{
    private static final long serialVersionUID = -7694494507527861090L;

    private String areaCode;

    private String areaName;

    private List<PlaceExtended> details;

    public String getAreaCode() {
        return areaCode;
    }

    public void setAreaCode(String areaCode) {
        this.areaCode = areaCode;
    }

    public String getAreaName() {
        return areaName;
    }

    public void setAreaName(String areaName) {
        this.areaName = areaName;
    }

    public List<PlaceExtended> getDetails() {
        return details;
    }

    public void setDetails(List<PlaceExtended> details) {
        this.details = details;
    }
}