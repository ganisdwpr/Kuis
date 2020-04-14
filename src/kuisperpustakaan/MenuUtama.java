/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package kuisperpustakaan;

import java.awt.Color;
import java.awt.Font;
import java.awt.event.ActionEvent;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;

/**
 *
 * @author ASUS
 */
public class MenuUtama {
    public static void main(String[] args) {
        Menu menu = new Menu();
    }
}

    class Menu extends JFrame {
         
        JLabel lTitle = new JLabel ("Menu Utama");
        JButton btnDataBuku = new JButton("Data Buku");
        JButton btnAnggota = new JButton("Data Anggota");
        JButton btnKaryawan = new JButton("Data Karyawan");
        JButton btnPeminjaman = new JButton("Data Peminjaman");
        
        public Menu(){
        setTitle("MENU");
	setDefaultCloseOperation(3);
        setSize(485,320);
        setLocation(700,400);
        setLayout(null);
        
        add(lTitle);
        lTitle.setBounds(155, 20, 500, 50);
        lTitle.setFont(new Font("Tw Cen MT Condensed Extra Bold",Font.BOLD, 30));
        lTitle.setForeground(Color.red);
        add(btnAnggota);
        btnAnggota.setBounds(30, 80, 180, 60);
        add(btnDataBuku);
        btnDataBuku.setBounds(250, 80, 180, 60);
        add(btnKaryawan);
        btnKaryawan.setBounds(30, 170, 180, 60);
        add(btnPeminjaman);
        btnPeminjaman.setBounds(250, 170, 180, 60);
               
        setVisible(true);
        
        //Menu input anggota
        btnAnggota.addActionListener((ActionEvent e) -> {
           Anggota anggota = new Anggota();
           dispose();
        });
        //Menu input data buku
        btnDataBuku.addActionListener((ActionEvent e) -> {
           DataBuku daftarbuku = new DataBuku();
           dispose();
        });
        //Menu input data karyawan
        btnKaryawan.addActionListener((ActionEvent e) -> {
           Karyawan karyawan = new Karyawan();
           dispose();
        });
        //Menu input data peminjaman/pengembalian buku
        btnPeminjaman.addActionListener((ActionEvent e) -> {
           Peminjaman peminjaman = new Peminjaman();
           dispose();
        });
    }    
    

}
