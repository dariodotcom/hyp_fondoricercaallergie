package root.controller.projects;

import java.util.List;

import org.slim3.controller.Controller;
import org.slim3.controller.Navigation;

import root.model.Project;
import root.model.ProjectType;
import root.service.ProjectGroupNav;
import root.service.ProjectService;

public class ByTypeController extends Controller {

    @Override
    public Navigation run() throws Exception {
        /* Retrieve type from request */
        ProjectType type;
        try {
            String typeStr = asString("type");
            type = ProjectType.valueOf(typeStr);
        } catch (IllegalArgumentException e) {
            requestScope("msg", "Tipo di progetto sconosciuto.");
            return forward("/projects/");
        } catch (NullPointerException e) {
            requestScope("msg", "Nessun tipo di progetto selezionato.");
            return forward("/projects/");
        }

        /* Retrieve project list and put it in request scope */
        String typeStr = type.toString();
        List<Project> projects =
            ProjectService.getProjectList("byType", typeStr);
        requestScope("projectList", projects);
        requestScope("projectType", typeStr);

        /* Starts group navigation */
        String navType = "byType";
        String navParam = type.toString();
        String navIndex = "/projects/byType?type=" + navParam;
        String navDesc = "Progetti su " + navParam;
        ProjectGroupNav g =
            new ProjectGroupNav(navType, navParam, navIndex, navDesc);
        g.updateSession(request.getSession());
        
        /* Forward navigation to jsp page. */
        return forward("byType.jsp");
    }
}