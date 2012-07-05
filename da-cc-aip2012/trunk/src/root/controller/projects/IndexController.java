package root.controller.projects;

import org.slim3.controller.Controller;
import org.slim3.controller.Navigation;

import root.model.ProjectType;

public class IndexController extends Controller {

    @Override
    public Navigation run() throws Exception {

        /* Put project types in request scope */
        requestScope("projectTypes", ProjectType.values());
        
        return forward("/projects/index.jsp");
    }
}
