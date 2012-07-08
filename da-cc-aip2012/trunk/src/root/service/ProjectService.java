package root.service;

import java.util.List;

import org.slim3.datastore.Datastore;
import org.slim3.datastore.FilterCriterion;

import root.meta.ProjectMeta;
import root.model.Project;
import root.model.ProjectType;

import com.google.appengine.api.datastore.Key;

public class ProjectService {

    // public static List<Project> getProjectList(){
    // return Datastore.query(ProjectMeta.get()).asList();
    // }

    /**
     * Queries the datastore for the list of projects corresponding to given
     * parameters.
     * 
     * @param type
     *            - the type of search to perform
     * @param param
     *            - an optional param
     * */
    public static List<Project> getProjectList(String type, String param) {
        ProjectMeta projectMeta = ProjectMeta.get();

        if (type.equals("byType")) {
            ProjectType projectType;
            try {
                projectType = ProjectType.valueOf(param);
            } catch (IllegalArgumentException e) {
                System.out
                    .println("Non exsisting project type passed to ProjectService");
                return Datastore
                    .query(projectMeta)
                    .sort(projectMeta.name.asc)
                    .asList();
            }

            /* Filter project with type not equal to given type */
            FilterCriterion criterion = projectMeta.type.equal(projectType);
            return Datastore
                .query(projectMeta)
                .filter(criterion)
                .sort(projectMeta.name.asc)
                .asList();
        } else {
            return Datastore
                .query(projectMeta)
                .sort(projectMeta.name.asc)
                .asList();
        }
    }

    /**
     * Retrieves a Project from the datastore.
     * 
     * @param key
     *            - the Key of the project to return
     * @return a Project
     * */
    public static Project get(Key projectKey) {
        Project project = Datastore.get(Project.class, projectKey);
        return project;
    }

    /**
     * Puts a Project into the datastore.
     * 
     * @param project
     *            - the Project to put into the datastore
     * */
    public static void put(Project project) {
        Datastore.put(project);
    }

}
