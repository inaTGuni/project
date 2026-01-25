<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">
<head>
<meta charset="UTF-8">
<title>Elegance Details</title>

<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        margin: 0;
        background: linear-gradient(135deg, #f2e8f7, #faf7fc);
        padding: 40px 20px;
        color: #444;
        animation: fade 0.6s ease;
    }

    @keyframes fade {
        from { opacity: 0; }
        to { opacity: 1; }
    }

    .card {
        max-width: 700px;
        margin: auto;
        background: #fff;
        padding: 40px 55px;
        border-radius: 20px;
        box-shadow: 0 20px 60px rgba(0,0,0,0.08);
        animation: fadeUp 0.7s ease forwards;
        opacity: 0;
    }

    @keyframes fadeUp {
        from { opacity: 0; transform: translateY(25px); }
        to   { opacity: 1; transform: translateY(0); }
    }

    h1 {
        text-align: center;
        color: #7b4a7d;
        font-weight: 300;
        margin-bottom: 30px;
    }

    p {
        line-height: 2;
        margin-bottom: 20px;
    }

    .button {
        display: block;
        width: 200px;
        margin: 30px auto 0;
        padding: 12px;
        text-align: center;
        background: linear-gradient(135deg, #b58bc6, #8b5aa3);
        color: white;
        border-radius: 8px;
        text-decoration: none;
        font-weight: bold;
        transition: 0.3s;
    }

    .button:hover {
        transform: scale(1.05);
        opacity: 0.9;
    }
    
    /* フォーム周りのスタイル調整 */
    #form {
        width: 100%;
        margin: 0 auto;
    }
    .mail {
        margin-bottom: 15px;
    }
    input[type="text"] {
        padding: 8px;
        border: 1px solid #ccc;
        border-radius: 4px;
        width: 60%;
    }
    input[type="color"] {
        border: none;
        width: 50px;
        height: 30px;
        vertical-align: middle;
        cursor: pointer;
    }
</style>
</head>

<body>

    <div class="card">
         <div id="form">
    
	<h1 class="form-title">記事を書こう</h1>
	
	<form action="./MyInputServlet" method="post">
		<p class="mail"><label>ニックネーム：<br><input type="text" name="name" maxlength="20" placeholder="お名前を入力"></label></p>

		<p class="mail"><label>書き入れる文字（２０文字）：<br><input type="text" name="data" maxlength="20" placeholder="メッセージを入力"></label></p>
		
		<p class="mail"><label>記事の背景色：<input type="color" name="color" value="#ffffff"></label></p>
		
		<p class="mail"><label>文字の色：　<input type="color" name="textColor" value="#000000"></label></p>
		
		<p class="mail"><input type="reset" value="リセット" class="button" style="background: #ccc; width: 100px; display:inline-block; margin: 10px;"></p>
		
		<p class="submit"><input type="submit" value="送信" class="button"></p>
	</form>
	
	</div>

       <a href="<%= request.getContextPath() %>/MyDataListServlet" class="button" style="background: #777;">記事を見る</a>

    </div>

</body>
</html>