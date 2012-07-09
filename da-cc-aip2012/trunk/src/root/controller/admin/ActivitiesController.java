package root.controller.admin;

import org.slim3.controller.Controller;
import org.slim3.controller.Navigation;

import root.service.ProjectService;

public class ActivitiesController extends Controller {

    @Override
    public Navigation run() throws Exception {
        /*
         * Retrieve project list from datastore, to let the user select which
         * project he wants to link new activity to
         */
        requestScope("projects", ProjectService.getProjectList("all", null));
        
        /* Forward navigation to jsp page. */
        return forward("activities.jsp");
    }
}
