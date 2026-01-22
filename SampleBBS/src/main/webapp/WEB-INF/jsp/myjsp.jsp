<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ネットワーク工学|イナガキ</title>

    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f7f7f7;
            color: #333;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            animation: fadeUp 0.8s ease forwards;
            opacity: 0;
        }

        @keyframes fadeUp {
            0% { opacity: 0; transform: translateY(20px); }
            100% { opacity: 1; transform: translateY(0); }
        }

        .container {
            text-align: center;
            padding: 40px 60px;
            background: #ffffff;
            border-radius: 20px;
            box-shadow: 0 15px 45px rgba(0, 0, 0, 0.08);
            max-width: 600px;
            width: 90%;
            transition: transform 0.3s ease-in-out;
        }

        .container:hover {
            transform: translateY(-6px);
        }

        h1 {
            color: #7b4a7d;
            font-size: 2.6em;
            letter-spacing: 2px;
            margin-bottom: 15px;
            font-weight: 300;
        }

        p {
            color: #555;
            line-height: 1.9;
            margin-bottom: 25px;
        }

        .button {
            display: inline-block;
            padding: 12px 30px;
            background: linear-gradient(135deg, #b58bc6, #8b5aa3);
            color: #fff;
            text-decoration: none;
            border-radius: 8px;
            font-weight: bold;
            letter-spacing: 1px;
            transition: 0.3s;
        }

        .button:hover {
            transform: scale(1.05);
            opacity: 0.9;
        }

        .time-display {
            margin-top: 20px;
            font-size: 0.9em;
            color: #888;
        }

        footer {
            margin-top: 30px;
            font-size: 0.8em;
            color: #aaa;
        }

        /* ▼▼▼ モーダル ▼▼▼ */
        .modal-bg {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.25);
            backdrop-filter: blur(5px);
            justify-content: center;
            align-items: center;
            animation: fadeIn 0.3s ease forwards;
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        .modal {
            background: #ffffff;
            border-radius: 20px;
            padding: 35px 45px;
            width: 85%;
            max-width: 420px;
            text-align: center;
            box-shadow: 0 20px 60px rgba(0,0,0,0.15);
            animation: popUp 0.35s ease;
            position: relative;
        }

        @keyframes popUp {
            0% { transform: scale(0.8); opacity: 0; }
            100% { transform: scale(1); opacity: 1; }
        }

        .modal-title {
            font-size: 1.8em;
            color: #7b4a7d;
            margin-bottom: 10px;
            font-weight: 300;
        }

        .modal-text {
            margin-bottom: 30px;
            color: #555;
        }

        .modal-button {
            padding: 10px 25px;
            background: linear-gradient(135deg, #b58bc6, #8b5aa3);
            color: #fff;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: 0.3s;
            margin: 5px;
        }

        .modal-button:hover {
            transform: scale(1.05);
        }

        /* 閉じるXボタン */
        .close-x {
            position: absolute;
            top: 12px;
            right: 15px;
            font-size: 20px;
            cursor: pointer;
            color: #999;
            transition: 0.3s;
        }

        .close-x:hover {
            color: #7b4a7d;
        }

    </style>

</head>
<body>

    <div class="container">
        <% java.util.Date now = new java.util.Date(); %>

        <h1>ひみつノート</h1>
        <p>
            記事を書くことができるサイトです<br>
            ページを進んで記事を書いてください。
        </p>

        <a href="#" class="button" onclick="openModal(event)">記事を書く</a>

<!--        <div class="time-display">現在時刻: <%= now %></div>-->

<!--        <footer>&copy; 2025 Elegant Concept</footer>-->
    </div>

    <!-- モーダル -->
    <div class="modal-bg" id="modalBg">
        <div class="modal">
            <div class="close-x" onclick="closeModal()">×</div>

            <div class="modal-title">記事ページへ進む</div>
            <div class="modal-text">記事を書きますか？</div>

            <button class="modal-button" onclick="goPage()">記事を書く</button>
            <button class="modal-button" onclick="closeModal()">戻る</button>
        </div>
    </div>

    <script>
        function openModal(event) {
            event.preventDefault();
            document.getElementById("modalBg").style.display = "flex";
        }

        function closeModal() {
            document.getElementById("modalBg").style.display = "none";
        }

        function goPage() {
            window.location.href = "Details";
        }
    </script>

</body>
</html>
