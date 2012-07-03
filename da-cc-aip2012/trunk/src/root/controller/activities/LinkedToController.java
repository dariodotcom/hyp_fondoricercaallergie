package root.controller.activities;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slim3.controller.Controller;
import org.slim3.controller.Navigation;
import org.slim3.datastore.EntityNotFoundRuntimeException;

import root.model.Activity;
import root.model.Project;
import root.service.ActivityGroupNav;
import root.service.ProjectService;

import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;

public class LinkedToController extends Controller {

    @Override
    public Navigation run() throws Exception {
        /* Retrieve project key from request */
        Key projectKey;
        try {
            projectKey = asKey("projectId");
        } catch (IllegalArgumentException ia) {
            requestScope("msg", "Errore: Nessun identificatore passato.");
            return forward("/activities/");
        }

        /* Retrieve required project through ProjectService */
        Project project;
        try {
            project = ProjectService.get(projectKey);
        } catch (EntityNotFoundRuntimeException enf) {
            requestScope("msg", "Errore: progetto non trovato.");
            return forward("/projects/");
        } catch (IllegalArgumentException enf) {
            requestScope(
                "msg",
                "Errore: identificativo di progetto non valido.");
            return forward("/projects/");
        }

        /* Put linked activities in request scope */
        List<Activity> linkedActivities =
            project.getActivityRef().getModelList();
        requestScope("linkedActivities", linkedActivities);
        requestScope("linkedProject", project);

        HttpSession s = request.getSession();

        /* Clear exsisting Group Nav */
        try {
            ActivityGroupNav old = new ActivityGroupNav(s);
            old.clearSession(s);
        } catch (NullPointerException e) {

        }

        /* Setup new Group Nav */
        String type = "linkedTo";
        String param = KeyFactory.keyToString(projectKey);
        String index = "/activities/linkedTo?projectId=" + param;
        String desc = "Attività collegate a " + project.getName();
        ActivityGroupNav nav = new ActivityGroupNav(type, param, index, desc);
        nav.updateSession(s);

        return forward("linkedTo.jsp");
    }
}
