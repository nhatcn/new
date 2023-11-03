<%--
    Document   : AddNew
    Created on : Oct 2, 2023, 11:03:13 AM
    Author     : NGMINHAT
--%>

<%@page import="model.Product"%>
<%@page import="DAO.ProductDAO"%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update New Product</title>
        <link rel="stylesheet" href="css/bootstrap.css">
    </head>
    <style>
        img{
            width: 50%;
        }
    </style>
    <body>
        <div class="container">
            <h1>Order Product</h1>
            <form action="order" method="post" onsubmit="return validateForm();">
                <div class="row">
                    <div class="col-md-2">
                        <div class="form-group">
                            <label for="orderID">Order ID</label>
                        </div>
                    </div>
                    <div class="col-md-10">
                        <div class="form-group">
                            <input name="orderID" type="text" class="form-control" id="orderID">
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
                            <input value="<%=request.getAttribute("usern")%>" name="userName" type="text" class="form-control" id="userName" readonly>
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-2">
                        <div class="form-group">
                            <label for="orderTotal">Total</label>
                        </div>
                    </div>
                    <div class="col-md-10">
                        <div class="form-group">
                            <input name="orderTotal" class="form-control" type="text" id="orderTotal">
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-2">
                        <div class="form-group">
                            <label for="orderDate">Date</label>
                        </div>
                    </div>
                    <div class="col-md-10">
                        <div class="form-group">
                            <input name="orderDate" type="date" class="form-control" id="orderDate">
                        </div>
                    </div>
                </div>

                <div class="row">
                    <div class="col-md-2">
                        <div class="form-group">
                            <label for="orderDes">Description</label>
                        </div>
                    </div>
                    <div class="col-md-10">
                        <div class="form-group">
                            <input name="orderDes" type="text" class="form-control" id="orderDes">
                        </div>
                    </div>
                </div>
                <button type="submit" class="btn btn-primary">Order</button>
                <button class="btn btn-danger"><a href="listOrder" class="btn btn-danger">Back to Home</a></button>
            </form>
        </div>

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
    </body>
</html>