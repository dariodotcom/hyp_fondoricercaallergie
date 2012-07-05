package root.controller.admin;

import org.slim3.controller.Controller;
import org.slim3.controller.Navigation;

import root.model.ProjectType;

public class ProjectsController extends Controller {

    @Override
    public Navigation run() throws Exception {
        /* Put project types into request scope */
        requestScope("projectTypes", ProjectType.values());
        
        return forward("projects.jsp");
    }
}
