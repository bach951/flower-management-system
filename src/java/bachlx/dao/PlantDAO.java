package bachlx.dao;

import bachlx.dto.Plant;
import bachlx.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Set;
import javax.swing.text.PlainDocument;
import javax.swing.text.html.HTMLDocument;

public class PlantDAO {

    public static ArrayList<Plant> getPlants(String keyword, String searchby) {
        ArrayList<Plant> list = new ArrayList<>();
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();

            if (cn != null && searchby != null) {
                String sql = "select PID, PName, price, imgPath, description, status, Plants.CateID as 'CateID', CateName\n"
                        + "from Plants join Categories on Plants.CateID = Categories.CateID\n";

                if (keyword == null && searchby == null) {
                    sql = "select PID, PName, price, imgPath, description, status, Plants.CateID as 'CateID', CateName\n"
                            + "from Plants";
                }
                if (searchby.equalsIgnoreCase("byname")) {
                    sql = sql + "where Plants.PName like ?";
                } else {
                    sql = sql + "where CateName like ?";
                }
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, "%" + keyword + "%");
                ResultSet rs = pst.executeQuery();
                if (rs != null) {
                    while (rs.next()) {
                        int id = rs.getInt("PID");
                        String name = rs.getString("PName");
                        int price = rs.getInt("price");
                        String imgpath = rs.getString("imgPath");
                        String description = rs.getString("description");
                        int status = rs.getInt("status");
                        int cateid = rs.getInt("cateID");
                        String catename = rs.getString("CateName");
                        Plant plant = new Plant(id, name, price, imgpath, description, status, cateid, catename);
                        list.add(plant);
                    }
                }

            }
        } catch (Exception e) {
        }
        return list;
    }

    public static Plant getItem(String pid) {
        Plant p = null;
        Connection cn;
        try {
            cn = DBUtils.makeConnection();
            String sql = "SELECT price, imgPath, PName from Plants where PID = ?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setString(1, pid);
            ResultSet rs = pst.executeQuery();
            if (rs != null && rs.next()) {
                int price = rs.getInt("price");
                String _imgPath = rs.getString("imgPath");
                String name = rs.getString("PName");
                p = new Plant(name, price, _imgPath);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return p;
    }

    public static Plant getPlant(int pid) {
        Plant p = null;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "SELECT PID, PName, price, imgPath, description,status, Plants.CateID as cateID, CateName\n"
                        + "from Plants, Categories\n"
                        + "where Plants.CateID = Categories.CateID and PID =?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setInt(1, pid);
                ResultSet rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    pid = rs.getInt("PID");
                    String pname = rs.getString("PName");
                    int price = rs.getInt("price");
                    String imgPath = rs.getString("imgPath");
                    String des = rs.getString("description");
                    int status = rs.getInt("status");
                    int cateid = rs.getInt("cateID");
                    String cateName = rs.getString("CateName");
                    p = new Plant(pid, pname, price, imgPath, des, status, cateid, cateName);
                }
            }
        } catch (Exception e) {
        } finally {
            try {
                cn.close();

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return p;
    }

    public static ArrayList<Plant> viewPlant() {
        Connection cn = null;
        ArrayList<Plant> listPlants = new ArrayList<>();
        try {
            cn = DBUtils.makeConnection();
            String sql = "SELECT PID, PName, price, imgPath, description, status, CateID FROM Plants";
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs != null && rs.next()) {
                int id = rs.getInt("PID");
                String name = rs.getString("PName");
                int price = rs.getInt("price");
                String imgpath = rs.getString("imgPath");
                String description = rs.getString("description");
                int status = rs.getInt("status");
                int cateid = rs.getInt("cateID");

                Plant plant = new Plant(id, name, price, imgpath, description, status, cateid);
                listPlants.add(plant);
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
        return listPlants;
    }

    public static boolean addNewPlant(String pName, int price, String imgPath, String description, int status, int cateId) {
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "insert into Plants (PName, price, imgPath, description,status, cateID) \n"
                        + "  values(?,?,?,?,?,?)";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, pName);
                pst.setInt(2, price);
                pst.setString(3, imgPath);
                pst.setString(4, description);
                pst.setInt(5, status);
                pst.setInt(6, cateId);
                pst.executeQuery();
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
        return true;
    }

    public static boolean updatePlant(String pName, int price, String imgPath, String description, int status, int cateId, int pId) {

        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = " UPDATE Plants SET PName = ?, price = ?, imgPath = ?, description = ?, status = ?, CateID = ? WHERE PID = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, pName);
                pst.setInt(2, price);
                pst.setString(3, imgPath);
                pst.setString(4, description);
                pst.setInt(5, status);
                pst.setInt(6, cateId);
                pst.setInt(7, pId);
                pst.executeQuery();
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
        return true;
    }

    public static ArrayList<Plant> viewCategories() {
        Connection cn = null;
        ArrayList<Plant> listCate = new ArrayList<>();
        try {
            cn = DBUtils.makeConnection();
            String sql = "SELECT CateID, CateName FROM Categories";
            Statement st = cn.createStatement();
            ResultSet rs = st.executeQuery(sql);
            while (rs != null && rs.next()) {
                int cateid = rs.getInt("CateID");
                String cateName = rs.getString("CateName");

                Plant cate = new Plant(cateid, cateName);
                listCate.add(cate);
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
        return listCate;
    }

    public static boolean addNewCate(String cateName) {
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "insert into Categories(CateName) \n"
                        + "                         values(?);";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, cateName);
                pst.executeQuery();
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
        return true;
    }

    public static boolean updateCate(String cateName, int cateId) {

        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            if (cn != null) {
                String sql = "UPDATE Categories SET CateName = ? WHERE CateID = ?";
                PreparedStatement pst = cn.prepareStatement(sql);
                pst.setString(1, cateName);
                pst.setInt(2, cateId);
                pst.executeQuery();
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
        return true;
    }

    public static Plant checkValidCateId(int cateId) {
        Plant p = null;
        Connection cn = null;
        try {
            cn = DBUtils.makeConnection();
            String sql = "SELECT CateID from Categories WHERE CateID =?";
            PreparedStatement pst = cn.prepareStatement(sql);
            pst.setInt(1, cateId);
            ResultSet rs = pst.executeQuery();
            if (rs != null && rs.next()) {
                cateId = rs.getInt("CateID");
                p = new Plant(cateId);
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
        return p;
    }
}
