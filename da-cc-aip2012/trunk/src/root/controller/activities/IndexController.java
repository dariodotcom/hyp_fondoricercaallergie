package root.controller.activities;

import org.slim3.controller.Controller;
import org.slim3.controller.Navigation;

import root.service.ActivityService;

public class IndexController extends Controller {

    @Override
    public Navigation run() throws Exception {
        requestScope("activities", ActivityService.getActivityList());
        return forward("index.jsp");
    }
}
