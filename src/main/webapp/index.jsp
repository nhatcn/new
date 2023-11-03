<%@page import="DAO.AccountDAO"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login Page</title>
        <link rel="stylesheet" href="css/bootstrap.css">

        <style>
            body {
                background-color: #f8f9fa;
            }

            .container {
                margin-top: 100px;
            }

            .card {
                width: 300px;
                margin: 0 auto;
            }
            p,h3{
                text-align: center;
            }
            p:first-child{
                font-weight: bold;
            }

        </style>
    </head>


    <body>

        <div class="container">
            <div class="card">
                <div class="card-body">
                    <h2 class="card-title">Login</h2>
                    <form  action="login" method="post" >
                        <div class="form-group">
                            <label  for="username">Username:</label>
                            <input value="" type="text" class="form-control" id="username" name="username">
                        </div>
                        <div class="form-group">
                            <label for="password">Password:</label>
                            <input type="password" class="form-control" id="password" name="password" placeholder="tat ca 123 het nha thay">
                        </div>
                        <button type="submit" class="btn btn-primary" name="btnSub">Login</button>
                        <div class="form-group">
                            <% if (request.getAttribute("mess") != null) {
                            %>
                            <span><%= request.getAttribute("mess")%></span>
                            <%
                            }%>
                        </div>
                    </form>
                </div>
            </div>
        </div>

    </body>
</html>
