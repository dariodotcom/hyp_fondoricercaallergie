package root.controller.projects;

import org.slim3.controller.Controller;
import org.slim3.controller.Navigation;

public class ProjectController extends Controller {

    @Override
    public Navigation run() throws Exception {
        return forward("project.jsp");
    }
}
