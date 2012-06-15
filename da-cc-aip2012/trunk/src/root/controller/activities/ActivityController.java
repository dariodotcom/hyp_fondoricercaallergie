package root.controller.activities;

import org.slim3.controller.Controller;
import org.slim3.controller.Navigation;

import root.model.Activity;
import root.model.Project;
import root.service.ActivityService;

import com.google.appengine.api.datastore.Key;

public class ActivityController extends Controller {

    @Override
    public Navigation run() throws Exception {
        Key activityKey;
        try{
            activityKey = asKey("id");
        }catch(IllegalArgumentException ia){
            //TODO: hande exception
            return forward("/activities/");
        }
        
        Activity activity = ActivityService.get(activityKey);
        requestScope("activity", activity);
        Project linkedProject = activity.getProjectRef().getModel();
        requestScope("linkedProject", linkedProject);
        return forward("activity.jsp");
    }
}
