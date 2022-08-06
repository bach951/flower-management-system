/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bachlx.dto;

import java.io.Serializable;
import java.sql.Array;
import java.util.ArrayList;

/**
 *
 * @author AD
 */
public class test implements Serializable{

    public static void main(String[] args) {
        int n = 0;
        double arr[] = {5.08, 5.44, 6.66, 5.07, 6.80, 5.43, 4.83,
            4.00, 4.41, 4.38, 7.00, 5.72, 4.53, 6.43, 3.97, 4.19,
            6.26, 6.72, 5.26, 5.48, 4.95, 6.33, 4.93, 5.61, 4.66,
            7.67, 5.57, 3.42, 5.18, 4.54};
        ArrayList<Array> arr1 = new ArrayList<>();
        double tg;
        for (int i = 0; i <= 29; i++) {
            for (int j = i + 1; j <= 29; j++) {
                if (arr[i] < arr[j]) {
                    // Hoan vi 2 so a[i] va a[j]
                    tg = arr[i];
                    arr[i] = arr[j];
                    arr[j] = tg;
                }
            }
        }

        for (int i = 0; i < 30; i++) {

            System.out.println(arr[i] + " ");
           
        }
    }
}
