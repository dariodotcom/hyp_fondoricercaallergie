package root.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import root.model.Project;

/**
 * Group Navigation for Projects
 * */
public class ProjectGroupNav extends GroupNav<Project> {

    public ProjectGroupNav(String type, String param, String index, String desc) {
        super(type, param, index, desc);
    }

    public ProjectGroupNav(HttpSession session) {
        super(session);
    }

    @Override
    protected String getGroupNavID() {
        return "projectGroupNav";
    }

    @Override
    protected List<Project> getElementList(String type, String param) {
        return ProjectService.getProjectList(type, param);
    }
}
