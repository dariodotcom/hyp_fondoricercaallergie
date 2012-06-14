package root.model;

import java.io.Serializable;

import org.slim3.datastore.Attribute;
import org.slim3.datastore.ModelRef;

import com.google.appengine.api.datastore.Key;

public class Activity implements Serializable{

    private static final long serialVersionUID = 6199425495827121935L;

    @Attribute(primaryKey = true)
    private Key key;

    @Attribute(version = true)
    private Long version;

    private String name;

    @Attribute(lob = true)
    private String generalInfo;

    @Attribute(lob = true)
    private String description;
    
    /*Relationships*/
    private ModelRef<Project> projectRef = new ModelRef<Project>(Project.class);
    
    public ModelRef<Project> getModelRef(){
        return projectRef;
    }

    /*Setters and getters*/
    public Key getKey() {
        return key;
    }

    public void setKey(Key key) {
        this.key = key;
    }

    public Long getVersion() {
        return version;
    }

    public void setVersion(Long version) {
        this.version = version;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGeneralInfo() {
        return generalInfo;
    }

    public void setGeneralInfo(String generalInfo) {
        this.generalInfo = generalInfo;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }    
}
