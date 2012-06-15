package root.service;

import java.util.List;

import org.slim3.datastore.Datastore;

import root.meta.ProjectMeta;
import root.model.Project;

import com.google.appengine.api.datastore.Key;

public class ProjectService {

    public static List<Project> getProjectList(){
        return Datastore.query(ProjectMeta.get()).asList();
    }
    
    public static Project get(Key projectKey) {
        Project project = Datastore.get(Project.class, projectKey);
        return project;
    }
    
    public static void put(Project project){
        Datastore.put(project);
    }
    
}
