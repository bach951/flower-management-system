/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bachlx.dao;
import bachlx.dto.Account;
import bachlx.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;

/**
 * @author AD
 */
public class AccountDAO {

    public static Account getAccount(String email, String password) {
        Connection cn = null;
        Account acc = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT accID, email, password, fullname, phone,status,role \n"
                        + "from dbo.Accounts\n"
                        + "WHERE status = 1 and email = ? and password = ? COLLATE Latin1_General_CS_AS";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, email);
                pst.setString(2, password);
                ResultSet rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    int AccID = rs.getInt("accID");
                    String Email = rs.getString("email");
                    String Password = rs.getString("password");
                    String Fullname = rs.getString("fullname");
                    String Phone = rs.getString("phone");
                    int Status = rs.getInt("status");
                    int Role = rs.getInt("role");
                    acc = new Account(AccID, Email, Password, Fullname, Status, Phone, Role);
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
        return acc;
    }

    public static ArrayList<Account> getAccounts() throws SQLException {
        Connection cn = null;
        Account acc;
        ArrayList<Account> listAccounts = new ArrayList<>();
        try {
            cn = DBUtils.makeConnection();
            String sql = "SELECT accID, email, password, fullname, phone, status, role from Accounts ";
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs != null && rs.next()) {
                int AccID = rs.getInt("accID");
                String Email = rs.getString("email");
                String Password = rs.getString("password");
                String Fullname = rs.getString("fullname");
                String Phone = rs.getString("phone");
                int Status = rs.getInt("status");
                int Role = rs.getInt("role");
                acc = new Account(AccID, Email, Password, Fullname, Status, Phone, Role);
                listAccounts.add(acc);
            }

        } catch (Exception e) {
        } finally {
            if (cn != null) {
                cn.close();
            }
        }
        return listAccounts;
    }

    public static boolean insertAccount(String email, String password, String fullname, String phone, int status, int role) {
        Connection cn = null;

        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "INSERT INTO Accounts(email, password, fullname, phone,status, role) \n"
                        + "VALUES(?, ?, ?, ?, 1, 0);";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, email);
                pst.setString(2, password);
                pst.setString(3, fullname);
                pst.setString(4, phone);
                ResultSet rs = pst.executeQuery();
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
        return true;
    }

    public static int updateToken(String token, String email) {
        Connection cn = null;
        int result = 0;

        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "update Accounts\n"
                        + "  set token = ?\n"
                        + "  Where email = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, token);
                pst.setString(2, email);
                result = pst.executeUpdate();
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
        return result;
    }

    public static Account checkToken(String token) {
        Connection cn = null;
        Account acc = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT token from Accounts WHere token = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, token);
                ResultSet rs = pst.executeQuery();

                if (rs != null) {
                    rs.next();
                    String Token = rs.getString("token");
                    acc = new Account(Token);
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

        return acc;
    }

    public static Account getAccountByToken(String token) throws SQLException, Exception {
        Connection cn = null;
        Account acc = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT accID, email, password, fullname, phone,status,role from Accounts where token = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, token);
                ResultSet rs = pst.executeQuery();

                if (rs != null && rs.next()) {
                    int AccID = rs.getInt("accID");
                    String Email = rs.getString("email");
                    String Password = rs.getString("password");
                    String Fullname = rs.getString("fullname");
                    String Phone = rs.getString("phone");
                    int Status = rs.getInt("status");
                    int Role = rs.getInt("role");
                    acc = new Account(AccID, Email, Password, Fullname, Status, Phone, Role);
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

        return acc;
    }

    public static boolean changeProfile(String fullname, String phonenumber, String email) {
        Connection cn = null;

        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "UPDate Accounts SET fullname = ? , phone = ? \n"
                        + "  where email = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, fullname);
                pst.setString(2, phonenumber);
                pst.setString(3, email);
                ResultSet rs = pst.executeQuery();
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
        return true;
    }

    public static int checkValidEmail(String email) {
        Connection cn = null;
        int result = 0;

        try {
            cn = DBUtils.makeConnection();
            String sql = "Select email from Accounts Where email =?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, email);
            ResultSet rs = pst.executeQuery();

            if (rs != null && rs.next()) {
                result = 1;
            } else {
                result = 0;
            }
        } catch (Exception e) {
        } finally {
            if (cn != null) {
                try {
                    cn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        return result;
    }

    public static void updateAccountStatus(String email, int status) {
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            String sql = "update Accounts SET status = ? where email = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, status);
            pst.setString(2, email);
            pst.executeQuery();
        } catch (Exception ee) {
            ee.printStackTrace();
        } finally {
            try {
                if (cn != null) {
                    cn.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }

    public static Account searchAccount(String fullName) {
        Connection cn = null;
        Account acc = null;
        try {
            cn = DBUtils.makeConnection();
            String sql = "SELECT accID, email, password, fullname, phone, status, role "
                    + "from Accounts where fullname = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, fullName);
            ResultSet rs = pst.executeQuery();
            while (rs != null && rs.next()) {
                int AccID = rs.getInt("accID");
                String Email = rs.getString("email");
                String Password = rs.getString("password");
                fullName = rs.getString("fullname");
                String Phone = rs.getString("phone");
                int Status = rs.getInt("status");
                int Role = rs.getInt("role");
                acc = new Account(AccID, Email, Password, fullName, Status, Phone, Role);
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
        return acc;
    }


}
