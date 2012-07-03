package root.service;

import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Class to manage a group navigation. Parameters are written into user session
 * so that it can run among different pages.
 * */
public abstract class GroupNav<E> {

    private String type;
    private String param;
    private String index;
    private String desc;

    /**
     * Creates a new Group Navigation.
     * 
     * @param type
     *            - the navigation type
     * @param param
     *            - the navigation param (only for multiple group of topics
     * @param index
     *            - the navigation index (the page the group navigation starts
     *            from)
     * @param desc
     *            - the navigation description
     */
    public GroupNav(String type, String param, String index, String desc) {
        if (type == null) {
            throw new NullPointerException("Null navType parameter");
        }

        this.type = type;
        this.param = param;
        this.index = index;
        this.desc = desc;
    }

    /**
     * Creates a new Group Navigation reading from user session.
     * 
     * @param session
     *            - the user's session
     * */
    public GroupNav(HttpSession session) {
        String t = (String) session.getAttribute(getGroupNavID() + "Type");
        String p = (String) session.getAttribute(getGroupNavID() + "Param");
        String i = (String) session.getAttribute(getGroupNavID() + "Index");
        String d = (String) session.getAttribute(getGroupNavID() + "Desc");

        this.type = t;
        if (type == null) {
            throw new NullPointerException("Null navType parameter");
        }

        this.param = p;
        this.index = i;
        this.desc = d;
    }

    /**
     * Removes Group Navigation parameters from session.
     * 
     * @param s
     *            - the session to clear
     * */
    public void clearSession(HttpSession s) {
        s.removeAttribute(toParamName("Type"));
        s.removeAttribute(toParamName("Param"));
        s.removeAttribute(toParamName("Index"));
        s.removeAttribute(toParamName("Desc"));
    }

    /**
     * Writes the parameters of this Group Navigation into a session
     * 
     * @param s
     *            - the session to write into
     * */
    public void updateSession(HttpSession s) {
        s.setAttribute(toParamName("Type"), type);
        s.setAttribute(toParamName("Param"), param);
        s.setAttribute(toParamName("Index"), index);
        s.setAttribute(toParamName("Desc"), desc);
    }

    /**
     * Writes the parameters of the group navigation into a request, so that the
     * navigation links (previous, next, index) can be displayed on the page.
     * 
     * @param r
     *            - the request to write into
     * @param current
     *            - the current element the user requested
     * */
    public void updateRequest(ServletRequest r, E current) {
        E prev = getNeighbor(current, -1);
        E next = getNeighbor(current, 1);

        if (prev != null || next != null) {
            r.setAttribute(getGroupNavID() + "Type", type);
            r.setAttribute(getGroupNavID() + "Index", index);
            r.setAttribute(getGroupNavID() + "Desc", desc);
            r.setAttribute(getGroupNavID() + "Prev", prev);
            r.setAttribute(getGroupNavID() + "Next", next);
        }
    }

    private E getNeighbor(E current, int offset) {
        List<E> elems = getElementList(type, param);
        int index = elems.indexOf(current);
        try {
            return elems.get(index + offset);
        } catch (IndexOutOfBoundsException ioob) {
            return null;
        }
    }

    private String toParamName(String b) {
        return getGroupNavID() + b;
    }

    /**
     * Retrieves the Group Navigation ID. Each subclasses must choose its one
     * avoiding duplicates. Two Group Navigation with the same ID written on the
     * same session / request will collide.
     * */
    protected abstract String getGroupNavID();

    /**
     * Retrieves the list of element corresponding to a group navigation of a
     * gyven type and, in case of multiple group of topic, to a given param.
     * Must be implemented by subclasses.
     * 
     * @param type
     *            - Group Navigation type
     * @param param
     *            - Group Navigation param
     * @return List<E> a list of elements
     * */
    protected abstract List<E> getElementList(String type, String param);
}
