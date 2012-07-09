package root.controller.projects;

import java.util.List;

import org.slim3.controller.Controller;
import org.slim3.controller.Navigation;

import root.model.Project;
import root.service.ProjectGroupNav;
import root.service.ProjectService;

public class AllController extends Controller {

    @Override
    public Navigation run() throws Exception {
        /* Retrieve project list */
        List<Project> projectList = ProjectService.getProjectList("all", null);
        requestScope("projectList", projectList);
        
        /* The user is starting a group navigation */
        ProjectGroupNav g =
            new ProjectGroupNav("all", null, "/projects/all", "Tutti i progetti");
        g.updateSession(request.getSession());
        
        /* Forward navigation to jsp page. */
        return forward("all.jsp");
    }
}
