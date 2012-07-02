package root.controller.admin;

import org.slim3.controller.Controller;
import org.slim3.controller.Navigation;

public class ProjectsController extends Controller {

    @Override
    public Navigation run() throws Exception {
        return forward("projects.jsp");
    }
}
