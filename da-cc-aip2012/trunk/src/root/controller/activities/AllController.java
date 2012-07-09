package root.controller.activities;

import java.util.List;

import org.slim3.controller.Controller;
import org.slim3.controller.Navigation;

import root.model.Activity;
import root.service.ActivityGroupNav;
import root.service.ActivityService;

public class AllController extends Controller {

    @Override
    public Navigation run() throws Exception {
        /* Retrieve activity list */
        List<Activity> activityList =
            ActivityService.getActivityList("all", null);

        /* Put it in request */
        requestScope("activityList", activityList);

        /* The user is starting a group navigation */
        ActivityGroupNav g =
            new ActivityGroupNav(
                "all",
                null,
                "/activities/all",
                "Tutte le attività");
        g.updateSession(request.getSession());

        /* Forward navigation to jsp page. */
        return forward("all.jsp");
    }
}
