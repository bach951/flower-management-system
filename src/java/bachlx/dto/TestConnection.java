/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bachlx.dto;

import bachlx.dao.AccountDAO;

/**
 *
 * @author AD
 */
public class TestConnection {

    public static void main(String[] args) {
        //test login
        Account acc = AccountDAO.getAccount("test@gmail.com", "test");
        if (acc != null) {
            if (acc.getRole() == 1) {
                System.out.println("i am an admin");
            } else {
                System.out.println("i am an user");
            }
        } else {
            System.out.println("login fail");
        }

    }
}
