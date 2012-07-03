package root.controller.activities;

import org.slim3.controller.Controller;
import org.slim3.controller.Navigation;

import root.service.ActivityGroupNav;
import root.service.ActivityService;

public class IndexController extends Controller {

    @Override
    public Navigation run() throws Exception {
        requestScope("activities", ActivityService.getActivityList());

        /* The user is starting a group navigation */
        ActivityGroupNav g =
            new ActivityGroupNav(
                "all",
                null,
                "/activities/",
                "Tutte le attività");
            g.updateSession(request.getSession());

        return forward("index.jsp");
    }
}
