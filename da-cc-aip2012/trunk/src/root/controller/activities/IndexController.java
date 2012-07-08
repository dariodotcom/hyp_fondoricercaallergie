package root.controller.activities;

import org.slim3.controller.Controller;
import org.slim3.controller.Navigation;

import root.model.ActivityType;

public class IndexController extends Controller {

    @Override
    public Navigation run() throws Exception {
        
        /*Put activity type list in request*/
        requestScope("activityTypes", ActivityType.values());
        
        return forward("index.jsp");
    }
}
