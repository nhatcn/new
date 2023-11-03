<%-- 
    Document   : UpdateOrder
    Created on : Oct 18, 2023, 7:23:56 PM
    Author     : NGMINHAT
--%>

<%@page import="model.Order"%>
<%@page import="model.Order"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
      <link rel="stylesheet" href="css/bootstrap.css">
    <body>
        <%

            Order o = (Order) request.getAttribute("list");
            if (o != null) {

        %>
        <div class="container">
            <h1>Order Product</h1>

            <form action="editOrder" method="post">
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
                            <input value="<%=o.getOrderTotal()%>"name="orderTotal" class="form-control" type="text" id="totalValue">
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
                            <input value="<%=o.getOrderDate()%>" name="orderDate" type="date" class="form-control" id="price" >
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
                            <input value="<%=o.getOrderDes()%>" name="orderDes" type="text" class="form-control" id="productID">
                        </div>
                    </div>
                </div>
                <button type="submit" class="btn btn-primary" onclick="return validateForm();">Update</button>
                <button  class="btn btn-danger"><a href="listOrder" class="btn btn-danger">Back to Home</a></button>
            </form>

        </div>
        <%
            }%>
    </body>
    <script>
            function validateForm() {
                var orderID = document.getElementById("orderID").value;
                var orderTotal = document.getElementById("orderTotal").value;
                var orderDate = document.getElementById("orderDate").value;
                var orderDes = document.getElementById("orderDes").value;

                if (orderID === "") {
                    alert("Order ID is required");
                    return false;
                }

                if (isNaN(parseFloat(orderTotal))) {
                    alert("Total must be a valid double number");
                    return false;
                }

                if (orderDate === "") {
                    alert("Date is required");
                    return false;
                }
                if (orderDes === "") {
                    alert("Description is required");
                    return false;
                }

                return true;
            }

        </script>
</html>
