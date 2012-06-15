package root.controller.projects;

import org.slim3.controller.Controller;
import org.slim3.controller.Navigation;

import root.service.ProjectService;

public class IndexController extends Controller {

    @Override
    public Navigation run() throws Exception {
        requestScope("projects", ProjectService.getProjectList());
        return forward("/projects/index.jsp");
    }
}
