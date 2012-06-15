package root.controller.admin;

import org.slim3.controller.Controller;
import org.slim3.controller.Navigation;

import root.model.Project;
import root.service.ProjectService;

public class CreateProjectController extends Controller {

    @Override
    public Navigation run() throws Exception {
        String projectName = asString("project_name");
        String projectInfo = asString("project_info");
        String projectDocumention = asString("project_documentation");
        
        Project project = new Project();
        project.setName(projectName);
        project.setGeneralInfo(projectInfo);
        project.setDocumentation(projectDocumention);
        ProjectService.put(project);
        
        return forward("/admin/");
    }
}
