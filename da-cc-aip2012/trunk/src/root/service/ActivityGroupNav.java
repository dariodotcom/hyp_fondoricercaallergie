package root.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import root.model.Activity;

public class ActivityGroupNav extends GroupNav<Activity> {

    public ActivityGroupNav(String type, String param, String index, String desc) {
        super(type, param, index, desc);
    }
    
    public ActivityGroupNav(HttpSession s){
        super(s);
    }

    @Override
    protected String getGroupNavID() {
        return "activityGroupNav";
    }

    @Override
    protected List<Activity> getElementList(String type, String param) {
        return ActivityService.getActivityList(type, param);
    }

}
