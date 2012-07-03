package root.controller.projects;

import org.slim3.controller.Controller;
import org.slim3.controller.Navigation;

import root.service.ProjectGroupNav;
import root.service.ProjectService;

public class IndexController extends Controller {

    @Override
    public Navigation run() throws Exception {
        requestScope("projects", ProjectService.getProjectList());

        /* The user is starting a group navigation */
        ProjectGroupNav g =
            new ProjectGroupNav("all", null, "/projects/", "Tutti i progetti");
        g.updateSession(request.getSession());

        return forward("/projects/index.jsp");
    }
}
