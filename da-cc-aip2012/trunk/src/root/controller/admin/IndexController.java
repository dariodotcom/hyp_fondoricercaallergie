package root.controller.admin;

import org.slim3.controller.Controller;
import org.slim3.controller.Navigation;

import root.service.ProjectService;

public class IndexController extends Controller {

    @Override
    public Navigation run() throws Exception {
        requestScope("projects", ProjectService.getProjectList());
        return forward("index.jsp");
    }
}
