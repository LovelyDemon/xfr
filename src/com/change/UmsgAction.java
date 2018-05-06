package com.change;

import com.util.DividePage;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

public class UmsgAction extends HttpServlet {

	private UmsgService service;
	/**
	 * Constructor of the object.
	 */
	public UmsgAction() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		
		String action_flag = request.getParameter("action_flag");
		//if (action_flag.equals("add")) {
		//	addProduct(request,response);
		//}else  

		System.out.print(action_flag);
		if (action_flag.equals("hf_search")) {
			list_hf(request,response);
		}else if (action_flag.equals("del_repl")) {
			System.out.print("dell!");
			
			del_repl(request,response);
		}
		else if (action_flag.equals("del_fav")) {
			System.out.print("dell!");
			
			del_fav(request,response);
		}
		else if (action_flag.equals("del_nepl")) {
			System.out.print("dell!");
			
			del_nepl(request,response);
		}
		else if (action_flag.equals("del_prpl")) {
			System.out.print("dell!");
			
			del_prpl(request,response);
		}
		else if (action_flag.equals("prpl_search")) {
			list_prpl(request,response);
		}
		else if (action_flag.equals("repl_search")) {
			list_repl(request,response);
		}
		else if (action_flag.equals("fav_search")) {
			list_fav(request,response);
		}
		else if (action_flag.equals("nepl_search")) {
			list_nepl(request,response);
		}
		else if (action_flag.equals("view_prpl")) {
			view_prpl(request,response);
		}
		else if (action_flag.equals("view_repl")) {
			view_repl(request,response);
		}
		else if (action_flag.equals("view_nepl")) {
			view_nepl(request,response);
		}
		else if (action_flag.equals("view_hf")) {
			view_hf(request,response);
		}
		out.flush();
		out.close();
	}

	private void view_hf(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		String huiid = request.getParameter("huiid");
		Map<String, Object> map = service.view_huifu(huiid);
		request.setAttribute("hfMap", map);
		try {
			request.getRequestDispatcher("/admin/umsg_view.jsp").forward(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
	}
	
	private void view_prpl(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		String prplid = request.getParameter("prplid");
		Map<String, Object> map = service.view_prpl(prplid);
		request.setAttribute("prplMap", map);
		try {
			request.getRequestDispatcher("/admin/umsg_view.jsp").forward(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
	}

	private void view_repl(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		String replid = request.getParameter("replid");
		Map<String, Object> map = service.view_repl(replid);
		request.setAttribute("replMap", map);
		try {
			request.getRequestDispatcher("/admin/umsg_view.jsp").forward(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
	}
	
	
	private void view_nepl(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		String neplid = request.getParameter("neplid");
		Map<String, Object> map = service.view_nepl(neplid);
		request.setAttribute("neplMap", map);
		try {
			request.getRequestDispatcher("/admin/umsg_view.jsp").forward(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		
	}
	
	/**批量删除产品
	 * @param request
	 * @param response
	 */


	private void del_repl(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		System.out.println("进入del");
		//获得复选框的值
		String[] ids = request.getParameterValues("ids");
		for (int i = 0; i < ids.length; i++) {
			System.out.println("ids["+i+"]="+ids[i]);
		}
		boolean flag = service.del_repl(ids);
		System.out.println("删除flag:"+flag);
		if (flag) {
			try {
				String script = "<script> alert('删除成功!');location.href='umsg_repl.jsp'</script>";
         		  response.setContentType("text/html;charset=UTF-8"); 
         		  response.getWriter().println(script);
				//request.getRequestDispatcher("/admin/sppl_manager.jsp").forward(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}		
	}

	private void del_fav(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		System.out.println("进入del");
		//获得复选框的值
		String[] ids = request.getParameterValues("ids");
		for (int i = 0; i < ids.length; i++) {
			System.out.println("ids["+i+"]="+ids[i]);
		}
		boolean flag = service.del_fav(ids);
		System.out.println("删除flag:"+flag);
		if (flag) {
			try {
				String script = "<script> alert('删除成功!');location.href='umsg_fav.jsp'</script>";
         		  response.setContentType("text/html;charset=UTF-8"); 
         		  response.getWriter().println(script);
				//request.getRequestDispatcher("/admin/sppl_manager.jsp").forward(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}		
	}
	
	private void del_nepl(HttpServletRequest request,
			HttpServletResponse response) {
		//获得复选框的值
		String[] ids = request.getParameterValues("ids");
		boolean flag = service.del_nepl(ids);
		if (flag) {
			try {
				String script = "<script> alert('删除成功!');location.href='umsg_nepl.jsp'</script>";
         		  response.setContentType("text/html;charset=UTF-8"); 
         		  response.getWriter().println(script);
				//request.getRequestDispatcher("/admin/sppl_manager.jsp").forward(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}		
	}
	
	private void del_prpl(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		System.out.println("进入del");
		//获得复选框的值
		String[] ids = request.getParameterValues("ids");
		for (int i = 0; i < ids.length; i++) {
			System.out.println("ids["+i+"]="+ids[i]);
		}
		boolean flag = service.del_prpl(ids);
		System.out.println("删除flag:"+flag);
		if (flag) {
			try {
				String script = "<script> alert('删除成功!');location.href='umsg_pl.jsp'</script>";
         		  response.setContentType("text/html;charset=UTF-8"); 
         		  response.getWriter().println(script);
				//request.getRequestDispatcher("/admin/sppl_manager.jsp").forward(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}		
	}
	
	private void list_hf(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		String huiname = (String)request.getSession().getAttribute("userName");
		System.out.println(huiname);
		String pageNum = request.getParameter("pageNum");
		String Lxsub = request.getParameter("lxsub");
		System.out.println("参数 pageNum :"+pageNum);
		if (huiname == null) {
			huiname = "";
		}
		
		int totalRecord = service.gethfCount(huiname); //获取总的记录数
		int currentPage = 1;
		DividePage dividePage = new DividePage(5, totalRecord);//默认第一页开始
		if (pageNum != null) {

			currentPage = Integer.parseInt(pageNum);			
			dividePage.setCurrentPage(currentPage);
		}
		
		//记录从第几行开始
		int start = dividePage.fromIndex();
		//显示几条记录
		int end = dividePage.toIndex();		
		
		System.out.println("currentPageNum :"+ dividePage.getCurrentPage() +", start = "+start +", end = "+end);
		
		List<Map<String, Object>> list = null;
		try {
			list = service.list_hf(huiname, start , end);
			
			request.setAttribute("listhf", list);
			request.setAttribute("dividePage", dividePage);
			request.setAttribute("Lxsub",Lxsub);
			request.getRequestDispatcher("/admin/umessage_main.jsp").forward(request, response);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}		
		
	}

	private void list_prpl(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		String pruname = (String)request.getSession().getAttribute("userName");
		String pageNum1 = request.getParameter("pageNum1");
		
		String prname = request.getParameter("prname");
		if (prname == null) {
			prname = "";
		}
		System.out.println("llllllllll"+prname);
		if (pruname == null) {
			pruname = "";
		}

		int totalRecord = service.getprplCount(pruname); //获取总的记录数
		int currentPage1 = 1;
		
		DividePage dividePage1 = new DividePage(5, totalRecord);//默认第一页开始
		if (pageNum1 != null) {

			currentPage1 = Integer.parseInt(pageNum1);			
			dividePage1.setCurrentPage(currentPage1);
		}
		
		//记录从第几行开始
		int start = dividePage1.fromIndex();
		//显示几条记录
		int end = dividePage1.toIndex();		
		
		System.out.println("currentPageNum :"+ dividePage1.getCurrentPage() +", start = "+start +", end = "+end);
		
		List<Map<String, Object>> list = null;
		try {
			list = service.list_prpl(prname,pruname, start , end);
			request.setAttribute("listprl", list);
			request.setAttribute("dividePage1", dividePage1);
			request.setAttribute("prname",prname);
			request.getRequestDispatcher("/admin/umsg_pl.jsp").forward(request, response);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}		
		
	}
	
	private void list_nepl(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		String neuname = (String)request.getSession().getAttribute("userName");
		String pageNum = request.getParameter("pageNum2");
		String nename = request.getParameter("nename");
		System.out.println("参数 pageNum :"+pageNum);
		if (neuname == null) {
			neuname = "";
		}
		if (nename == null) {
			nename = "";
		}
		int totalRecord2 = service.getneplCount(neuname); //获取总的记录数
		int currentPage = 1;
		DividePage dividePage = new DividePage(5, totalRecord2);//默认第一页开始
		if (pageNum != null) {

			currentPage = Integer.parseInt(pageNum);			
			dividePage.setCurrentPage(currentPage);
		}
		
		//记录从第几行开始
		int start = dividePage.fromIndex();
		//显示几条记录
		int end = dividePage.toIndex();		
		
		System.out.println("currentPageNum :"+ dividePage.getCurrentPage() +", start = "+start +", end = "+end);
		
		List<Map<String, Object>> list = null;
		try {
			list = service.list_nepl(nename,neuname, start , end);
			request.setAttribute("listnepl", list);
			request.setAttribute("dividePage2", dividePage);
			request.setAttribute("neuname",neuname);
			request.getRequestDispatcher("/admin/umsg_nepl.jsp").forward(request, response);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}		
		
	}
	
	private void list_repl(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		String reuname = (String)request.getSession().getAttribute("userName");
		String pageNum = request.getParameter("pageNum3");
		String rename = request.getParameter("rename");
		System.out.println("参数 pageNum :"+pageNum);
		if (reuname == null) {
			reuname = "";
		}
		if (rename == null) {
			rename = "";
		}
		int totalRecord = service.getreplCount(reuname); //获取总的记录数
		int currentPage = 1;
		DividePage dividePage = new DividePage(5, totalRecord);//默认第一页开始
		if (pageNum != null) {

			currentPage = Integer.parseInt(pageNum);			
			dividePage.setCurrentPage(currentPage);
		}
		
		//记录从第几行开始
		int start = dividePage.fromIndex();
		//显示几条记录
		int end = dividePage.toIndex();		
		
		System.out.println("currentPageNum :"+ dividePage.getCurrentPage() +", start = "+start +", end = "+end);
		
		List<Map<String, Object>> list = null;
		try {
			list = service.list_repl(rename,reuname, start , end);
			request.setAttribute("listrepl", list);
			request.setAttribute("dividePage3", dividePage);
			request.setAttribute("reuname",reuname);
			request.setAttribute("rename",rename);
			request.getRequestDispatcher("/admin/umsg_repl.jsp").forward(request, response);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}		
		
	}
	
	private void list_fav(HttpServletRequest request,
			HttpServletResponse response) {
		// TODO Auto-generated method stub
		String reuname = (String)request.getSession().getAttribute("userName");
		String pageNum = request.getParameter("pageNum3");
		String rename = request.getParameter("rename");
		System.out.println("参数 pageNum :"+pageNum);
		if (reuname == null) {
			reuname = "";
		}
		if (rename == null) {
			rename = "";
		}
		int totalRecord = service.getfavCount(reuname); //获取总的记录数
		int currentPage = 1;
		DividePage dividePage = new DividePage(5, totalRecord);//默认第一页开始
		if (pageNum != null) {

			currentPage = Integer.parseInt(pageNum);			
			dividePage.setCurrentPage(currentPage);
		}
		
		//记录从第几行开始
		int start = dividePage.fromIndex();
		//显示几条记录
		int end = dividePage.toIndex();		
		
		System.out.println("currentPageNum :"+ dividePage.getCurrentPage() +", start = "+start +", end = "+end);
		
		List<Map<String, Object>> list = null;
		try {
			list = service.list_fav(rename,reuname, start , end);
			request.setAttribute("listfav", list);
			request.setAttribute("dividePage3", dividePage);
			request.setAttribute("reuname",reuname);
			request.setAttribute("rename",rename);
			request.getRequestDispatcher("/admin/umsg_fav.jsp").forward(request, response);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}		
		
	}
		



	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
		service = new UmsgDao();
	}

}