package servlet;

import java.io.IOException;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Dao;

/**
 * Servlet implementation class MyInputServlet
 */
@WebServlet("/MyInputServlet")
public class MyInputServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyInputServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//requestから受け取る値の文字コードをUTF-8に設定．これがないと，たまに文字化けする．
				request.setCharacterEncoding("UTF-8");
				
				//requestから，"id"というnameの値を取得
				String data = request.getParameter("data");
				
				//コンソールにdataを表示
				System.out.println("テキストボックス："+ data);
				
				//requestから，"id"というnameの値を取得
				String color = request.getParameter("color");
				//コンソールにdataを表示
				System.out.println("カラーパレット　："+ color);
				//requestから，"id"というnameの値を取得
				String date = request.getParameter("date");
				
				//コンソールにdataを表示
				System.out.println("年/月/日　　　　："+ date);
				Timestamp now = new Timestamp(System.currentTimeMillis());
				if(date == "") {
					date = now.toString();
				}
				String name = request.getParameter("name");
				String textColor = request.getParameter("textColor");
				
				System.out.println("ニックネーム　　：" + name);
				System.out.println("文字色　　　　　：" + textColor);
				
				//requestから，"id"というnameの値を取得
				String radio1 = request.getParameter("radio1");
				
				
				
				System.out.println("\n");
				
//				//requestから，"password"というnameの値を取得
//				String password = request.getParameter("password");

				//DBアクセスのためのクラスをインスタンス化
				Dao dao = new Dao();
//				//idを渡し，そのidを持つユーザをDBから取得.Userはbeansパッケージに宣言してある．
//				User user = dao.getUserById(data);
//
//				//先ほどのidを持つユーザが存在し，かつパスワードが入力したものと一致していればArticleListServletにアクセスを移動．
//				if(user != null && user.getPassword().equals(password)) {
//					//Sessionオブジェクトを取得し，userIdという名前でidを格納．このセッションが生きている限り，いつでもuserIdを取り出せるようになる．
//					request.getSession().setAttribute("userId" , data);
//					RequestDispatcher dispatcher = request.getRequestDispatcher("./ArticleListServlet");
//					dispatcher.forward(request, response);
//				}
//				else {
//					//認証失敗の場合は，ログインページに戻す．
//					RequestDispatcher dispatcher = request.getRequestDispatcher("./WEB-INF/jsp/details.jsp");
//					dispatcher.forward(request, response);
//				}
//

				// Daoへ渡す
				
			      
//			       Dao dao = new Dao();
			       dao.insertMyData(data,color,date, name, textColor);
			       
			    // ★ ここが重要 ★
			       request.getRequestDispatcher("/MyDataListServlet")
			              .forward(request, response);
			       
			       //コンソールにdataを表示
			       System.out.println("data = "+data);
//			    }
			}
			
			//POSTアクセスのみを受け付けたいので，doGetは定義しない．

		}
