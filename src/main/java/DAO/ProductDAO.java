/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DBconect.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Product;

/**
 *
 * @author NGMINHAT
 */
public class ProductDAO {

    Connection conn;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public ProductDAO() {
        try {
            conn = DBConnection.connect();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public ResultSet getAll() {
        try {

            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("select * from product");
            return rs;
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public Product addNew(Product p) {
        try {
            PreparedStatement ps = conn.prepareStatement("Insert into product values(?,?,?,?,?,?)");
            ps.setString(1, p.getProID());
            ps.setString(2, p.getProName());
            ps.setInt(3, p.getProQuan());
            ps.setDouble(4, p.getProPrice());
            ps.setString(5, p.getProPic());
            ps.setString(6, p.getProDes());

            int count = ps.executeUpdate();
            return (count == 0) ? null : p;
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;

    }
    public Product getProductByID(String proID) {
        Product p = null;
        try {
            PreparedStatement ps = conn.prepareStatement("select * from product where pro_id=" + "\'" + proID + "\'");

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                p =  new Product(rs.getString(1), rs.getString(2), rs.getInt(3), rs.getDouble(4), rs.getString(5), rs.getString(6));
            }
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return p;
    }
    public Product update(String proID, Product p) {
        int count = 0;
        try {
            PreparedStatement ps = conn.prepareStatement("Update product set pro_id=?, pro_name=?, pro_price=?, pro_quan=?, pro_pic=?, pro_des=? where pro_id=" + "\'" + proID + "\'");
            ps.setString(1, p.getProID());
            ps.setString(2, p.getProName());
            ps.setDouble(3, p.getProPrice());
            ps.setInt(4, p.getProQuan());
            ps.setString(5, p.getProPic());
            ps.setString(6, p.getProDes());
          

            count = ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return (count == 0) ? null : p;
    }
     public void delete(String proID) {
        try {
            PreparedStatement ps = conn.prepareStatement("delete from product where pro_id=" + "\'" + proID + "\'");
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(ProductDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
