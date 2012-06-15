package root.controller.admin;

import org.slim3.controller.Controller;
import org.slim3.controller.Navigation;

import com.google.appengine.api.datastore.Key;

import root.model.Activity;
import root.model.Project;
import root.service.ActivityService;
import root.service.ProjectService;

public class CreateActivityController extends Controller{

    @Override
    protected Navigation run() throws Exception {
        String name = asString("activity_name");
        String info = asString("activity_info");
        String description = asString("activity_documentation");
        Activity activity = new Activity();
        activity.setName(name);
        activity.setGeneralInfo(info);
        activity.setDescription(description);
        
        Key linkedProjectKey;
        try{
           linkedProjectKey = asKey("linked_project");
        }catch(IllegalArgumentException ia){
            //TODO: handle exception;
            return forward("/admin/");
        }
        
        Project linkedProject = ProjectService.get(linkedProjectKey);
        activity.getProjectRef().setModel(linkedProject);
        
        ActivityService.put(activity);
        
        // TODO Auto-generated method stub
        return forward("/admin/");
    }

}
