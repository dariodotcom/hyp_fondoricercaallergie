package root.controller.projects;

import org.slim3.controller.Controller;
import org.slim3.controller.Navigation;

import root.model.ProjectType;
import root.model.ProjectYear;

public class IndexController extends Controller {

    @Override
    public Navigation run() throws Exception {

        /* Put project types and years in request scope */
        requestScope("projectTypes", ProjectType.values());
        requestScope("projectYears", ProjectYear.values());
        
        return forward("/projects/index.jsp");
    }
}
