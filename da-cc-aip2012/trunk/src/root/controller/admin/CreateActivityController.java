package root.controller.admin;

import org.slim3.controller.Controller;
import org.slim3.controller.Navigation;

import com.google.appengine.api.datastore.Key;

import root.model.Activity;
import root.model.Project;
import root.service.ActivityService;
import root.service.ProjectService;

public class CreateActivityController extends Controller {

    @Override
    protected Navigation run() throws Exception {
        String name = asString("activity_name");
        if (!checkString(name)) {
            requestScope("admin_msg", "Errore: Il campo 'Nome' è vuoto.");
            return forward("/admin/activities");
        }

        String info = asString("activity_info");
        if (!checkString(info)) {
            requestScope(
                "admin_msg",
                "Errore: Il campo 'Informazioni' è vuoto.");
            return forward("/admin/activities");
        }

        String description = asString("activity_description");
        if (!checkString(description)) {
            requestScope("admin_msg", "Errore: Il campo 'Descrizione' è vuoto.");
            return forward("/admin/activities");
        }

        Key linkedProjectKey;
        try {
            linkedProjectKey = asKey("linked_project");
        } catch (IllegalArgumentException ia) {
            requestScope(
                "admin_msg",
                "Errore: Il campo 'Progetto collegato' è vuoto.");
            return forward("/admin/activities");
        }

        Activity activity = new Activity();
        activity.setName(name);
        activity.setGeneralInfo(info);
        activity.setDescription(description);

        Project linkedProject = ProjectService.get(linkedProjectKey);
        activity.getProjectRef().setModel(linkedProject);

        ActivityService.put(activity);

        requestScope("activity_name", "");
        requestScope("activity_info", "");
        requestScope("activity_description", "");
        requestScope("admin_msg", "Attività creata.");
        
        
        // TODO Auto-generated method stub
        return forward("/admin/activities");
    }

    private boolean checkString(String str) {
        return str != null && str.length() > 0;
    }

}
