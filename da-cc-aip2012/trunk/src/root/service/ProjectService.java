package root.service;

import org.slim3.datastore.Datastore;

import root.model.Project;

import com.google.appengine.api.datastore.Key;


public class ProjectService {

    public static Project get(Key projectKey) {
        Project author = Datastore.get(Project.class, projectKey);
        return author;
    }
    
    public static void put(Project project){
        Datastore.put(project);
    }
    
}
