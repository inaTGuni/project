package servlet;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import beans.MyData;
import dao.Dao;


/**
 * Servlet implementation class MyDataListServlet
 */
@WebServlet("/MyDataListServlet")
public class MyDataListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

	//POSTアクセスされた場合は，doGetに丸投げ
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			doGet(request,response);
		}
		
		//GETアクセスされた場合に動作
		protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			//DBアクセスのためのクラスをインスタンス化
			Dao dao = new Dao();
			
			//時間経過してない記事を表示させない
			Timestamp now = new Timestamp(System.currentTimeMillis());
			//すべてのMyDataのリストを取得．NyDataクラスはbeansパッケージに宣言してある．
			List<MyData> mdList = dao.getMyDataList();
			for(int i = mdList.size()-1; i>=0; i--){
				System.out.println(now +"/" + mdList.get(i).getBooking() + "/"+mdList.get(i).getBooking().before(now));
				if(mdList.get(i).getBooking().after(now)) {
					mdList.remove(i);
				}
			}

			//requestに記事リストを格納．
			request.setAttribute("mdList" , mdList);

			//./WEB-INF/jsp/articleList.jspを表示
			RequestDispatcher dispatcher = request.getRequestDispatcher("./WEB-INF/jsp/mdList.jsp");
			dispatcher.forward(request, response);
		}

}
