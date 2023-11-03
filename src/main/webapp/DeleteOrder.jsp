<%-- 
    Document   : DeleteOrderjsp
    Created on : Oct 18, 2023, 6:59:50 PM
    Author     : NGMINHAT
--%>

<%@page import="model.Order"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/bootstrap.css">
    </head>
    <body>
        <%

            Order o = (Order) request.getAttribute("list");
            if (o != null) {

        %>
        <div class="container">
            <h1>Order Product</h1>

            <form action="deleteOrder" method="post">
                <div class="row">
                    <div class="col-md-2">
                        <div class="form-group">
                            <label for="orderID">Order ID</label>
                        </div>
                    </div>
                    <div class="col-md-10">
                        <div class="form-group">
                            <input value="<%=o.getOrderID()%>" name="orderID" type="text" class="form-control" id="productID" readonly>
                        </div>
                    </div>
                </div>


                <div class="row">
                    <div class="col-md-2">
                        <div class="form-group">
                            <label>User Name</label>
                        </div>
                    </div>

                    <div class="col-md-10">
                        <div class="form-group">
                            <input value="<%=o.getUserName()%>"  name="userName" type="text" class="form-control" id="productName" readonly>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-2">
                        <div class="form-group">
                            <label for="total">Total</label>
                        </div>
                    </div>
                    <div class="col-md-10">
                        <div class="form-group">
                            <input value="<%=o.getOrderTotal()%>"name="orderTotal" class="form-control" type="text" id="totalValue" readonly>
                        </div>
                    </div>

                </div>
                <div class="row">
                    <div class="col-md-2">
                        <div class="form-group">
                            <label for="price">Date</label>
                        </div>
                    </div>

                    <div class="col-md-10">
                        <div class="form-group">
                            <input value="<%=o.getOrderDate()%>" name="orderDate" type="date" class="form-control" id="price" readonly="">
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-2">
                        <div class="form-group">
                            <label for="description">Description</label>
                        </div>
                    </div>

                    <div class="col-md-10">
                        <div class="form-group">
                            <input value="<%=o.getOrderDes()%>" name="orderDes" type="text" class="form-control" id="productID" readonly="">
                        </div>
                    </div>
                </div>
                <button type="submit" class="btn btn-primary" onclick="return validateForm();">Delete</button>
                <button  class="btn btn-danger"><a href="listOrder" class="btn btn-danger">Back to Home</a></button>
            </form>

        </div>
        <%
            }%>
    </body>
</html>
