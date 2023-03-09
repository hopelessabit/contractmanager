/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package abc.utils;

import java.sql.Date;

/**
 *
 * @author mical
 */
public class GetDate {
    public static int[] getDate(){
        int[] a = new int[3];
        Date date = new Date(System.currentTimeMillis());
        String s1 = date.toString();
        String[] words=s1.split("-");
        int count = 0;
        for (String word : words) {
            a[count] = Integer.parseInt(word);
            count++;
        }
        return a;
    }
    public static int[] convert(String s1){
        int[] a = new int[3];
        String[] words=s1.split("-");
        int count = 0;
        for (String word : words) {
            a[count] = Integer.parseInt(word);
            count++;
        }
        return a;
    }
    public static Date getDate(int[] a){
        a[0] -= 1900;
        a[1] -= 1;
        Date date = new Date(a[0],a[1],a[2]);
        System.out.println(date);
        return date;
    }
}
