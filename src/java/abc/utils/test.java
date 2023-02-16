/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package abc.utils;

import abc.customers.CustomerDAO;
import abc.customers.CustomerDTO;

/**
 *
 * @author mical
 */
public class test {
    public static void main(String[] args) {
        CustomerDTO user = new CustomerDTO();
        user = CustomerDAO.getAccount("khachhanga@gmail.com", "123");
        System.out.println(user.toString());
    }
}
