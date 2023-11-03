/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Order;
import model.Product;

/**
 *
 * @author NGMINHAT
 */
public class OrderDAO {

    Connection conn;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public OrderDAO() {
        try {
            conn = DBconect.DBConnection.connect();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    //UPDATE [order]SET [username] = ?,[order_total] = ?, [order_date] = ?, [order_des] = ? WHERE [order_id] = ?;

    public Order update(String oID, Order o) {
        int count = 0;
        try {
            PreparedStatement ps = conn.prepareStatement("UPDATE [order]SET [order_id] = ?, [username] = ?,[order_total] = ?, [order_date] = ?, [order_des] = ? WHERE [order_id] = ?");
            ps.setString(1, o.getOrderID());
            ps.setString(2, o.getUserName());
            ps.setDouble(3, o.getOrderTotal());
            ps.setString(4, o.getOrderDate());
            ps.setString(5, o.getOrderDes());
            ps.setString(6, oID);

            count = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return (count == 0) ? null : o;
    }

    public Order addNew(Order order) {
        try {
            PreparedStatement ps = conn.prepareStatement("Insert into [order] values(?,?,?,?,?)");
            ps.setString(1, order.getOrderID());
            ps.setString(2, order.getUserName());
            ps.setDouble(3, order.getOrderTotal());
            ps.setString(4, order.getOrderDate());
            ps.setString(5, order.getOrderDes());
            int count = ps.executeUpdate();
            return (count == 0) ? null : order;
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;

    }

    public ResultSet getAll() {
        try {

            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("select * from [order]");
            return rs;
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public void delete(String orderID) {
        try {
            PreparedStatement ps = conn.prepareStatement("delete from [order] where order_id=" + "\'" + orderID + "\'");
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Order getOrderByID(String oID) {
        Order o = null;
        try {
            PreparedStatement ps = conn.prepareStatement("select * from [order] where order_id=" + "\'" + oID + "\'");

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                o = new Order(rs.getString(1), rs.getString(2), rs.getDouble(3), rs.getString(4), rs.getString(5));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return o;
    }

    
}
