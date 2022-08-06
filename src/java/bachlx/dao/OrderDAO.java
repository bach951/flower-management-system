package bachlx.dao;

import bachlx.dto.Order;
import bachlx.dto.OrderDetail;
import bachlx.utils.DBUtils;
import java.sql.Connection;
import java.sql.Date;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Set;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author AD
 */
public class OrderDAO {

    public static ArrayList<Order> getOrders(String email) {
        ArrayList<Order> listOrders = new ArrayList<Order>();

        Connection cn = null;
        Order order = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT  OrderID, OrdDate, shipdate, Orders.status, Orders.AccID\n"
                        + "  From Orders, Accounts\n"
                        + "  WHERE email = ? and Orders.AccID = Accounts.accID";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, email);
                ResultSet rs = pst.executeQuery();

                while (rs != null && rs.next()) {
                    int _orderID = rs.getInt("OrderID");
                    String _OrderDate = rs.getString("OrdDate");
                    System.out.println(rs.getDate("OrdDate"));
                    String _shipDate = rs.getString("shipdate");
                    if (_shipDate == null) {
                        _shipDate = "0000-00-00";
                    }
                    int _status = rs.getInt("status");
                    int _accID = rs.getInt("AccID");
                    order = new Order(_orderID, _OrderDate.substring(0, 10), _shipDate.substring(0, 10), _status, _accID);
                    listOrders.add(order);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (cn != null) {
                try {
                    cn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return listOrders;
    }

    public static ArrayList<OrderDetail> getOrderDetail(int orderID) {
        Connection cn = null;
        ArrayList<OrderDetail> listOrderDetail = new ArrayList<>();
        try {
            //buoc 1: mo ket noi
            cn = DBUtils.makeConnection();
            //buoc 2 viet cau query va execute
            if (cn != null) {
                String sql = "SELECT DetailId, OrderID, PID, PName, price, imgPath, quantity FROM OrderDetails, Plants\n"
                        + "  WHERE OrderID = ? and OrderDetails.FID = Plants.PID";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, orderID);
                ResultSet rs = pst.executeQuery();
                while (rs != null && rs.next()) {
                    int _DetailId = rs.getInt("DetailId");
                    int _PID = rs.getInt("PID");
                    String _PName = rs.getString("PName");
                    int _price = rs.getInt("price");
                    String _imgPath = rs.getString("imgPath");
                    int _quantity = rs.getInt("quantity");
                    OrderDetail orderDetail = new OrderDetail(_DetailId, orderID, _PID, _PName, _price, _imgPath, _quantity);
                    listOrderDetail.add(orderDetail);
                }
            }
        } catch (Exception e) {
        } finally {
            if (cn != null) {
                try {
                    cn.close();
                } catch (SQLException ex) {
                    Logger.getLogger(OrderDAO.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
        return listOrderDetail;
    }

    public static void canceledOrders(int orderid) {
        Connection cn = null;
        try {

            cn = DBUtils.makeConnection();
            String sql = "Update Orders set status = 3 where OrderID = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, orderid);
            pst.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (cn != null) {
                    cn.close();
                }
            } catch (SQLException exception) {
                exception.printStackTrace();
            }
        }
    }

    public static void orderAgain(int orderid) {
        Connection cn = null;
        try {

            cn = DBUtils.makeConnection();
            String sql = " Update Orders set status = 1 where OrderID = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, orderid);
            pst.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (cn != null) {
                    cn.close();
                }
            } catch (SQLException exception) {
                exception.printStackTrace();
            }
        }
    }

    public static boolean insertOrder(String email, HashMap<String, Integer> cart) {
        Connection cn = null;
        boolean result = false;

        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                int accid = 0, orderid = 0;
                cn.setAutoCommit(false);
                String sql = "select accID from Accounts where email=?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, email);
                ResultSet rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    accid = rs.getInt("accID");
                }
                System.out.println("accountid: " + accid);
                long millis = System.currentTimeMillis();
                java.sql.Date d = new java.sql.Date(millis);
                System.out.println("order date: " + d);
                sql = "insert Orders(OrdDate,status,AccID) values (?,?,?)";
                pst = cn.prepareStatement(sql);
                pst.setDate(1, d);
                pst.setInt(2, 1);
                pst.setInt(3, accid);
                pst.executeUpdate();
                sql = "select top 1 orderID from Orders order by orderID desc";
                pst = cn.prepareStatement(sql);
                rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    orderid = rs.getInt("orderID");
                    System.out.println("orderid: " + orderid);
                    Set<String> pids = cart.keySet();
                    for (String pid : pids) {
                        sql = "insert OrderDetails values(?,?,?)";
                        pst = cn.prepareStatement(sql);
                        pst.setInt(1, orderid);
                        pst.setInt(2, Integer.parseInt(pid.trim()));
                        pst.setInt(3, cart.get(pid));
                        pst.executeUpdate();
                        cn.commit();
                        cn.setAutoCommit(true);
                    }
                    return true;
                } else {
                    System.out.println("k chen order dc");
                }
            }
        } catch (Exception e) {
            try {
                if (cn != null) {
                    cn.rollback();
                }
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
            e.printStackTrace();
            result = false;
        } finally {
            try {
                if (cn != null) {
                    cn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return result;
    }

    public static ArrayList<Order> searchDate(String accId, String dateFrom, String dateTo) {
        Order od;
        ArrayList<Order> listDate = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            String sql = "SELECT OrderID, OrdDate, shipdate,Orders.status,AccID FROM Orders \n"
                    + "                   WHERE AccID =? AND OrdDate between ? AND ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, accId);
            pst.setString(2, dateFrom);
            pst.setString(3, dateTo);
            ResultSet rs = pst.executeQuery();
            while (rs != null && rs.next()) {
                int orderID = rs.getInt("OrderID");
                String orderDate = rs.getString("OrdDate");
                String shipDate = rs.getString("shipdate");
                if (shipDate == null) {
                    shipDate = "0000-00-00";
                }
                int status = rs.getInt("status");
                int _accId = rs.getInt("AccID");
                od = new Order(orderID, orderDate.substring(0, 10), shipDate.substring(0, 10), status, _accId);
                listDate.add(od);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (cn != null) {
                try {
                    cn.close();
                } catch (Exception e) {
                }
            }
        }
        return listDate;
    }

    public static ArrayList<Order> manageOrder() {
        Connection cn = null;
        Order order = null;
        ArrayList<Order> listOrders = new ArrayList<>();
        try {
            cn = DBUtils.makeConnection();
            String sql = "SELECT OrderID, OrdDate, shipdate, status, AccID\n"
                    + "  FROM Orders";
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs != null && rs.next()) {
                int _orderID = rs.getInt("OrderID");
                String _OrderDate = rs.getString("OrdDate");
                System.out.println(rs.getDate("OrdDate"));
                String _shipDate = rs.getString("shipdate");
                if (_shipDate == null) {
                    _shipDate = "0000-00-00";
                }
                int _status = rs.getInt("status");
                int _accID = rs.getInt("AccID");
                order = new Order(_orderID, _OrderDate.substring(0, 10), _shipDate.substring(0, 10), _status, _accID);
                listOrders.add(order);
            }

        } catch (Exception e) {
        } finally {
            try {
                if (cn != null) {
                    cn.close();
                }
            } catch (Exception e) {
            }
        }
        return listOrders;
    }

    public static boolean saveShipDate(String shipDate, int orderID) {

        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            String sql = "UPDATE Orders \n"
                    + "SET shipdate =? WHERE orderid = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, shipDate);
            pst.setInt(2, orderID);
            int result = pst.executeUpdate();
            if (result != 0) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (cn != null) {
                    cn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return false;
    }

    public static ArrayList<Order> searchDateOrders(String dateFrom, String dateTo) {
        Order od;
        ArrayList<Order> listDate = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            String sql = "SELECT OrderID, OrdDate, shipdate,Orders.status,AccID FROM Orders \n"
                    + "                 WHERE OrdDate between ? AND ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, dateFrom);
            pst.setString(2, dateTo);
            ResultSet rs = pst.executeQuery();
            while (rs != null && rs.next()) {
                int orderID = rs.getInt("OrderID");
                String orderDate = rs.getString("OrdDate");
                String shipDate = rs.getString("shipdate");
                if (shipDate == null) {
                    shipDate = "0000-00-00";
                }
                int status = rs.getInt("status");
                int _accId = rs.getInt("AccID");
                od = new Order(orderID, orderDate.substring(0, 10), shipDate.substring(0, 10), status, _accId);
                listDate.add(od);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (cn != null) {
                try {
                    cn.close();
                } catch (Exception e) {
                }
            }
        }
        return listDate;
    }
}
