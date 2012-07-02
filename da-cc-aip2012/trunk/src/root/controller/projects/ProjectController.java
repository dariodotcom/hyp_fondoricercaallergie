package root.controller.projects;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slim3.controller.Controller;
import org.slim3.controller.Navigation;

import root.model.Activity;
import root.model.Project;
import root.service.ProjectService;

import com.google.appengine.api.datastore.Key;

public class ProjectController extends Controller {

    @Override
    public Navigation run() throws Exception {
        Key projectKey;
        try {
            projectKey = asKey("id");
        } catch (IllegalArgumentException ia) {
            // TODO: print error.
            System.out.println("Null project id passed.");
            return forward("/projects/");
        }

        Project project = ProjectService.get(projectKey);
        requestScope("project", project);
        List<Activity> linkedActivities =
            project.getActivityRef().getModelList();
        requestScope("linkedActivities", linkedActivities);

        /* Group navigation management */
        HttpSession session = request.getSession();
        String navType = (String) session.getAttribute("groupNav");
        if (navType.equals("all")) {
            List<Project> list = ProjectService.getProjectList();
            int index = list.indexOf(project);
            Project prev, next;
            
            try{
                prev = list.get(index - 1);
                System.out.println("prev project: " + prev.getName());
            }catch(IndexOutOfBoundsException ioe){
                prev = null;
            }
            
            try{
                next = list.get(index + 1);
                System.out.println("next project: " + next.getName());
            }catch(IndexOutOfBoundsException ioe){
                next = null;
            }
            
            if(prev != null || next != null){
                requestScope("groupNav", "all");
                requestScope("groupNavName", session.getAttribute("groupNavName"));
                requestScope("groupNavIndex", session.getAttribute("GroupNavIndex"));
                requestScope("groupNavPrev", prev);
                requestScope("groupNavNext", next);
            }   
        }
        
        return forward("project.jsp");
    }
}