package root.controller.admin;

import org.slim3.controller.Controller;
import org.slim3.controller.Navigation;

import root.model.Project;
import root.service.ProjectService;

public class CreateProjectController extends Controller {

    @Override
    public Navigation run() throws Exception {
        String projectName = asString("project_name");
        if(!checkString(projectName)){
            requestScope("admin_msg", "Errore: Il campo 'Nome' è vuoto.");
            return forward("/admin/projects");
        }
        
        String projectInfo = asString("project_info");
        if(!checkString(projectInfo)){
            requestScope("admin_msg", "Errore: Il campo 'Informazioni' è vuoto.");
            return forward("/admin/projects");
        }
        
        String projectDocumention = asString("project_documentation");
        if(!checkString(projectDocumention)){
            requestScope("admin_msg", "Errore: Il campo 'Documentazione' è vuoto.");
            return forward("/admin/projects");
        }
        
        Project project = new Project();
        project.setName(projectName);
        project.setGeneralInfo(projectInfo);
        project.setDocumentation(projectDocumention);
        
        ProjectService.put(project);

        requestScope("project_name", "");
        requestScope("project_info", "");
        requestScope("project_documentation", "");
        requestScope("admin_msg", "Progetto creato.");
        
        return forward("/admin/projects");
    }
    
    private boolean checkString(String str){
        return str != null && str.length() > 0;
    }
}
