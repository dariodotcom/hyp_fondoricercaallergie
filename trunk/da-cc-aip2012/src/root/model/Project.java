package root.model;

import java.io.Serializable;

import org.slim3.datastore.Attribute;

import com.google.appengine.api.datastore.Key;

public class Project implements Serializable{

    private static final long serialVersionUID = 5634517710947521127L;

    @Attribute(primaryKey = true)
    private Key key;

    @Attribute(version = true)
    private Long version;
    
    private String name;
    
    @Attribute(lob=true)
    private String generalInfo;
    
    @Attribute(lob=true)
    private String documentation;

    public Key getKey() {
        return key;
    }

    public void setKey(Key key) {
        this.key = key;
    }

    public String getGeneralInfo() {
        return generalInfo;
    }

    public void setGeneralInfo(String generalInfo) {
        this.generalInfo = generalInfo;
    }

    public String getDocumentation() {
        return documentation;
    }

    public void setDocumentation(String documentation) {
        this.documentation = documentation;
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
    
    
}
