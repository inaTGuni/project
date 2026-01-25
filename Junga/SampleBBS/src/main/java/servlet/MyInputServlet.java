package servlet;

import java.io.IOException;

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
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//requestから受け取る値の文字コードをUTF-8に設定
		request.setCharacterEncoding("UTF-8");
		
		//requestから値を取得
		String data = request.getParameter("data");
		String color = request.getParameter("color");
		
		// 追加：名前と文字色を取得
		String name = request.getParameter("name");
		String textColor = request.getParameter("textColor");
		
		//コンソールに表示して確認
		System.out.println("テキストボックス：" + data);
		System.out.println("カラーパレット　：" + color);
		System.out.println("ニックネーム　　：" + name);
		System.out.println("文字色　　　　　：" + textColor);
		System.out.println("\n");

		// DBアクセスのためのクラスをインスタンス化
		Dao dao = new Dao();
		
		// Daoへ渡す（引数を4つに変更）
		dao.insertMyData(data, color, name, textColor);
		
		// 一覧画面へ転送
		request.getRequestDispatcher("/MyDataListServlet")
			   .forward(request, response);
	}
	
	//POSTアクセスのみを受け付けたいので，doGetは定義しない．
}