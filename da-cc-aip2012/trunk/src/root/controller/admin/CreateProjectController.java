package root.controller.admin;

import org.slim3.controller.Controller;
import org.slim3.controller.Navigation;

import root.model.Project;
import root.model.ProjectType;
import root.service.ProjectService;

public class CreateProjectController extends Controller {

    @Override
    public Navigation run() throws Exception {
        /*
         * In case of error: - do not clear request so that JSP page will
         * re-display correct parameters; - send request to main project page
         * including an error message that will be displayed.
         */

        /* Retrieve from request the name of the project to create. */
        String projectName = asString("project_name");
        if (!checkString(projectName)) {
            requestScope("admin_msg", "Errore: Il campo 'Nome' è vuoto.");
            return forward("/admin/projects");
        }

        /* Retrieve from request the type of the project to create. */
        ProjectType projectType;
        try {
            String typeStr = asString("project_type");
            projectType = ProjectType.valueOf(typeStr);
        } catch (NullPointerException e) {
            requestScope("admin_msg", "Errore: nessun tipo di progetto.");
            return forward("/admin/");
        } catch (IllegalArgumentException e) {
            requestScope("admin_msg", "Errore: tipo di progetto non corretto.");
            return forward("/admin/");
        }

        /* Retrieve from request the informations of the project to create. */
        String projectInfo = asString("project_info");
        if (!checkString(projectInfo)) {
            requestScope(
                "admin_msg",
                "Errore: Il campo 'Informazioni' è vuoto.");
            return forward("/admin/projects");
        }

        /* Retrieve from request the documentation of the project to create. */
        String projectDocumention = asString("project_documentation");
        if (!checkString(projectDocumention)) {
            requestScope(
                "admin_msg",
                "Errore: Il campo 'Documentazione' è vuoto.");
            return forward("/admin/projects");
        }

        /* Create new project and set fields */
        Project project = new Project();
        project.setName(projectName);
        project.setGeneralInfo(projectInfo);
        project.setDocumentation(projectDocumention);
        project.setType(projectType);

        /* Put project into Datastore */
        ProjectService.put(project);

        /* Clear request */
        requestScope("project_name", "");
        requestScope("project_info", "");
        requestScope("project_documentation", "");
        requestScope("admin_msg", "Progetto creato.");

        /* Send request to project creation page */
        return forward("/admin/projects");
    }

    private boolean checkString(String str) {
        return str != null && str.length() > 0;
    }
}
