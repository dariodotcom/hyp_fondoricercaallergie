package root.controller.projects;

import org.slim3.controller.Controller;
import org.slim3.controller.Navigation;
import org.slim3.datastore.EntityNotFoundRuntimeException;

import root.model.Project;
import root.service.ProjectGroupNav;
import root.service.ProjectService;

import com.google.appengine.api.datastore.Key;

public class ProjectController extends Controller {

    @Override
    public Navigation run() throws Exception {

        /* Retrieve required project key from request */
        Key projectKey;
        try {
            projectKey = asKey("id");
        } catch (IllegalArgumentException ia) {
            requestScope("msg", "Errore: nessun identificativo passato.");
            System.out.println("Null project id passed.");
            return forward("/projects/");
        }

        /* Retrieve required project through ProjectService */
        Project project;
        try {
            project = ProjectService.get(projectKey);
        } catch (EntityNotFoundRuntimeException enf) {
            requestScope("msg", "Errore: progetto non trovato.");
            return forward("/projects/");
        } catch (IllegalArgumentException enf) {
            requestScope(
                "msg",
                "Errore: identificativo di progetto non valido.");
            return forward("/projects/");
        }

        /* Put required project into request scope */
        requestScope("project", project);

        /* Manage group navigation */
        try {
            ProjectGroupNav g = new ProjectGroupNav(request.getSession());
            g.updateRequest(request, project);
        } catch (NullPointerException e) {
            // No GroupNav in session; go on.
        }

        return forward("project.jsp");
    }
}