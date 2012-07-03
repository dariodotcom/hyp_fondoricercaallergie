package root.controller.activities;

import org.slim3.controller.Controller;
import org.slim3.controller.Navigation;
import org.slim3.datastore.EntityNotFoundRuntimeException;

import root.model.Activity;
import root.model.Project;
import root.service.ActivityGroupNav;
import root.service.ActivityService;

import com.google.appengine.api.datastore.Key;

public class ActivityController extends Controller {

    @Override
    public Navigation run() throws Exception {
        /* Read required activity key from request */
        Key activityKey;
        try {
            activityKey = asKey("id");
        } catch (IllegalArgumentException ia) {
            requestScope("msg", "Errore: Nessun identificatore passato.");
            return forward("/activities/");
        }

        /* Retrieve required activity through ActivityService */
        Activity activity;
        try {
            activity = ActivityService.get(activityKey);
        } catch (EntityNotFoundRuntimeException enf) {
            requestScope("msg", "Errore: attività non trovata.");
            return forward("/activities/");
        } catch (IllegalArgumentException enf) {
            requestScope(
                "msg",
                "Errore: identificativo di attività non valido.");
            return forward("/projects/");
        }

        /* Put required activity in request scope */
        requestScope("activity", activity);
        Project linkedProject = activity.getProjectRef().getModel();
        requestScope("linkedProject", linkedProject);

        /* Manage group navigation */
        try {
            ActivityGroupNav g = new ActivityGroupNav(request.getSession());
            g.updateRequest(request, activity);
        } catch (NullPointerException e) {
            //No GroupNav found in session; go on;
        }
        
        return forward("activity.jsp");
    }
}