package tandr.service.event;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EventWriteForm implements CommandProcess {

	public String requestPro(HttpServletRequest request, HttpServletResponse response) {

		return "eventwriteForm";
	}
}
