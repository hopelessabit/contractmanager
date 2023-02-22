/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package abc.customer;

import abc.owner.OwnerDAO;
import abc.owner.OwnerDTO;

/**
 *
 * @author mical
 */
public class test {
    public static void main(String[] args) {
        OwnerDTO test = OwnerDAO.getAccount("chunhaa@gmail.com", "123");
        System.out.println(test.toString());
        System.out.println(test.getAvatar());
    }
}
