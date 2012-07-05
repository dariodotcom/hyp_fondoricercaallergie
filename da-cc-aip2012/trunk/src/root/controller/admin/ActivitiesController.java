package root.controller.admin;

import org.slim3.controller.Controller;
import org.slim3.controller.Navigation;

import root.service.ProjectService;

public class ActivitiesController extends Controller {

    @Override
    public Navigation run() throws Exception {
        requestScope("projects", ProjectService.getProjectList("all", null));
        return forward("activities.jsp");
    }
}
