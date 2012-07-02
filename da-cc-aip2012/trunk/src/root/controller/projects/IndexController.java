package root.controller.projects;

import org.slim3.controller.Controller;
import org.slim3.controller.Navigation;

import root.service.ProjectService;

public class IndexController extends Controller {

    @Override
    public Navigation run() throws Exception {
        requestScope("projects", ProjectService.getProjectList());
        
        /*The user is starting a group navigation*/
        sessionScope("groupNav", "all");
        sessionScope("groupNavName", "Tutti i progetti");
        sessionScope("groupNavIndex", "/projects/");
        
        return forward("/projects/index.jsp");
    }
}
