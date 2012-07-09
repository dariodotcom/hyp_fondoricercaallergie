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
        /*
         * In case of error, do not clear request so that JSP page will
         * re-display correct paramters.
         */

        /* Retrieve from request the name of the activity to create. */
        String name = asString("activity_name");
        if (!checkString(name)) {
            requestScope("admin_msg", "Errore: Il campo 'Nome' è vuoto.");
            return forward("/admin/activities");
        }

        /* Retrieve from request the Informations of the activity to create. */
        String info = asString("activity_info");
        if (!checkString(info)) {
            requestScope(
                "admin_msg",
                "Errore: Il campo 'Informazioni' è vuoto.");
            return forward("/admin/activities");
        }

        /* Retrieve from request the description of the activity to create. */
        String description = asString("activity_description");
        if (!checkString(description)) {
            requestScope("admin_msg", "Errore: Il campo 'Descrizione' è vuoto.");
            return forward("/admin/activities");
        }

        /*
         * Retrieve from request the key of the project linked to the new
         * activity.
         */
        Key linkedProjectKey;
        try {
            linkedProjectKey = asKey("linked_project");
        } catch (IllegalArgumentException ia) {
            /* Forward request to activity page, printing an error message. */
            requestScope(
                "admin_msg",
                "Errore: Il campo 'Progetto collegato' è vuoto.");
            return forward("/admin/activities");
        }

        /* Create new activity and set its fields */
        Activity activity = new Activity();
        activity.setName(name);
        activity.setGeneralInfo(info);
        activity.setDescription(description);

        /* Set activity's linked project */
        Project linkedProject = ProjectService.get(linkedProjectKey);
        activity.getProjectRef().setModel(linkedProject);

        /* Put new activity into datastore */
        ActivityService.put(activity);

        /*
         * Clear request fields (otherwise they'd be re-displayed in activity
         * creation page)
         */
        requestScope("activity_name", "");
        requestScope("activity_info", "");
        requestScope("activity_description", "");
        requestScope("admin_msg", "Attività creata.");

        /* Forward navigation to jsp page. */
        return forward("/admin/activities");
    }

    /**
     * Checks if a string is not null and has lenght > 0.
     * 
     * @param str
     *            - the String to test
     * @return true if the passed String is not null and has length > 0
     * */
    private boolean checkString(String str) {
        return str != null && str.length() > 0;
    }

}
