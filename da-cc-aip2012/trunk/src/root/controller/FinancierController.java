package root.controller;

import org.slim3.controller.Controller;
import org.slim3.controller.Navigation;

public class FinancierController extends Controller {

    @Override
    public Navigation run() throws Exception {
        /* Forward navigation to jsp page. */
        return forward("financier.jsp");
    }
}
