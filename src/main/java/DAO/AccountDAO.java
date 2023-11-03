/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import DBconect.DBConnection;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Account;

/**
 *
 * @author NGMINHAT
 */
public class AccountDAO {

    Connection conn;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public AccountDAO() {
        try {
            conn = DBConnection.connect();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

     public Account login(String user, String pass) {
        String password = hashMD5(pass);
        try {
            ps = conn.prepareStatement("select * from account\n"
                    + "where [username] = ?\n"
                    + "and password = ?");
            ps.setString(1, user);
            ps.setString(2, password);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Account(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4),
                        rs.getString(5), rs.getString(5)
                );
            }
        } catch (Exception e) {
        }
        return null;
    }
    public String getFullName(String username) {

        String query = "select fullname from account\n"
                + "where username = ?";
        try {

            ps = conn.prepareStatement(query);
            ps.setString(1, username);
            rs = ps.executeQuery();
            String a = rs.getString(1);
            return a;
        } catch (Exception e) {
        }
        return null;
    }

    public ResultSet getAll() {
        try {

            Statement st = conn.createStatement();
            ResultSet rs = st.executeQuery("select * from account");
            return rs;
        } catch (SQLException ex) {
            Logger.getLogger(AccountDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public static String hashMD5(String input) {
        try {
            // Tạo một đối tượng MessageDigest với thuật toán MD5
            MessageDigest md = MessageDigest.getInstance("MD5");

            // Chuyển đổi chuỗi thành mảng byte
            byte[] bytes = input.getBytes(StandardCharsets.UTF_8);

            // Cập nhật dữ liệu vào đối tượng MessageDigest
            md.update(bytes);

            // Lấy giá trị băm (hash) dưới dạng mảng byte
            byte[] digest = md.digest();

            // Chuyển đổi mảng byte thành chuỗi hex
            StringBuilder sb = new StringBuilder();
            for (byte b : digest) {
                sb.append(String.format("%02x", b));
            }

            return sb.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return null;
        }
    }
}
