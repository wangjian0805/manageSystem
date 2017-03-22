package com.tasly.deepureflow.domain.system;

import javax.xml.bind.annotation.XmlRootElement;

@XmlRootElement(name = "Hierarchy")
public class Hierarchy {
    private Integer hierarchyId;

    private String hierarchyName;

    private String hierarchyNick;

    private Integer isDelete;

    public Integer getHierarchyId() {
        return hierarchyId;
    }

    public void setHierarchyId(Integer hierarchyId) {
        this.hierarchyId = hierarchyId;
    }

    public String getHierarchyName() {
        return hierarchyName;
    }

    public void setHierarchyName(String hierarchyName) {
        this.hierarchyName = hierarchyName == null ? null : hierarchyName.trim();
    }

    public String getHierarchyNick() {
        return hierarchyNick;
    }

    public void setHierarchyNick(String hierarchyNick) {
        this.hierarchyNick = hierarchyNick == null ? null : hierarchyNick.trim();
    }

    public Integer getIsDelete() {
        return isDelete;
    }

    public void setIsDelete(Integer isDelete) {
        this.isDelete = isDelete;
    }
}