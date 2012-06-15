package root.controller.projects;

import org.slim3.controller.Controller;
import org.slim3.controller.Navigation;

import root.model.Project;
import root.service.ProjectService;

import com.google.appengine.api.datastore.Key;

public class ProjectController extends Controller {

    @Override
    public Navigation run() throws Exception {
        Key projectKey;
        try {
            projectKey = asKey("id");
        } catch (IllegalArgumentException ia) {
            // TODO: print error.
            System.out.println("Null project id passed.");
            return forward("/projects/");
        }

        Project project = ProjectService.get(projectKey);
        requestScope("project", project);
        return forward("project.jsp");
    }
}