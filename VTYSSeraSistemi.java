/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vtys.sera.sistemi;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Scanner;
import java.sql.*;

/**
 *
 * @author user
 */
public class VTYSSeraSistemi {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        String Sifre,
               Kullaniciadi,
               isimGirdisi,
               isimGirdi,
               veriAkisi,
               
               girisDeger;
        int kullanici_secim = 0; 
        
        //kullanıcı adı ve şifreyi sorgulamak için DBsorgu sınıfını kullanıyoruz.
        
        DBsorgu sorgu = DBsorgu.getSorgu();
        
        //kullanıcı adı için 
        Scanner KA = new Scanner(System.in);
        Scanner SF = new Scanner(System.in);
        
        //Kullanıcıdan değer aldığımız kısım.
        System.out.println("Kullanici Adi :");
        Kullaniciadi = KA.next();
        System.out.println("Sifre :");
        Sifre = SF.next();
        
        //Sql bilgilerini aldığımız kısım.
        sorgu.sqlSorgu();
        
        //Girilen değerlerle sql dekileri karşılaştırdığımız fonksiyonu çağırıyoruz.
          sorgu.sorgulama(Kullaniciadi,Sifre);   
          
          
      while (kullanici_secim != 5){
          
       try
        {   //Bağlantı kurulumu.
            Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/vtysdb","postgres","2391a3a2343b58d9.");
            if (conn != null)
                System.out.println("Veritabanına bağlandı!");
            else
                System.out.println("Bağlantı girişimi başarısız!");
                
                
        System.out.println("Yapmak İstediğiniz İşlemi Seçiniz...");
        System.out.println("1 => KULLANICI NO SORGULAMA...");
        System.out.println("2 => KULLANICI NO DEĞİŞTİRME...");
        System.out.println("3 => KULLANICI SİLME...");
        System.out.println("4 => KULLANICI EKLEME...");
        System.out.println("5 => UYGULAMADAN ÇIKIŞ... \n");
        
        //kullanıcının seçimini uygulamamız için kullanıcıdan seçim için girdi alıyoruz.
        Scanner giris = new Scanner(System.in);
        kullanici_secim=giris.nextInt();
        
        //kullanıcının seçeneğine göre uygulamamızın işlemi uygulaması için switch case e giriyor.
        switch (kullanici_secim) {
        
            case 1 :
            
            System.out.println("SORGULANACAK KULLANICI NO GİRİNİZ...");
            Scanner girr = new Scanner(System.in);
            girisDeger = girr.nextLine(); 
            
            veriAkisi= "SELECT * FROM \"Kullanıcı\" WHERE \"kullanıcıNo\" = \'";
            veriAkisi = veriAkisi + girisDeger + "\'";
                        
            //Sorgu Çalıştırma.
            Statement stmt = conn.createStatement();
            ResultSet result = stmt.executeQuery(veriAkisi);
            
            //Bağlantı Sonlandırma.
            conn.close();
                       
            System.out.println("SORGULANIYOR...");
            
            
            String
                kullanıcıNo,
                seraSayısı,
                yetiştirilenBitkiler,
                seraKonumu;  

                       while(result.next())
                       {
                           //KAYITTAKİ VERİLERİ DEĞİŞKENLERİNE ATAMA.
                           kullanıcıNo  = result.getString("kullanıcıNO");
                           seraSayısı = result.getString("seraSayısı");
                           yetiştirilenBitkiler = result.getString("yetiştirilenBitkiler");
                           seraKonumu = result.getString("seraKonumu");
                          
                           //EKRANA YAZDIRMA.
                           System.out.println("Kullanici NO : "+ kullanıcıNo);
                           System.out.println("Sahip Olunan Sera Sayısı : " + seraSayısı);
                           System.out.println("Yetistirilen Bitki Türleri : " + yetiştirilenBitkiler);
                           System.out.println("Seranın Bulunduğu Konum : " + seraKonumu);
                           
                        }
                        result.close();
                        stmt.close();
 
            break;


        case 2 :
            System.out.println("Güncellenecek Kullanıcı No'yu Giriniz...");
            Scanner giri = new Scanner(System.in);
            isimGirdisi = giri.nextLine();         

            System.out.println("Atanacak Yeni Kullanıcı No'yu Giriniz...");
            Scanner giriş = new Scanner(System.in);
            isimGirdi = giriş.nextLine();         

            veriAkisi= "UPDATE \"Kullanıcı\" SET \"kullanıcıNo\" = \'";
            veriAkisi = veriAkisi + isimGirdi + "\' WHERE \"kullanıcıNo\" = \'" + isimGirdisi + "\'";

            //Sorgu Çalıştırma.
            Statement stmt1 = conn.createStatement();
            stmt1.executeUpdate(veriAkisi);
            System.out.print("Güncellendi...");

            //Bağlantı Sonlandırma.
            conn.close();
            stmt1.close();
            break;

 
        case 3 :
           System.out.println("Silmek İstediğiniz Kullanıcı No'yu Giriniz...");
           Scanner girri = new Scanner(System.in);
           isimGirdisi = girri.nextLine();         
           veriAkisi = "DELETE FROM \"Kullanıcı\" WHERE \"kullanıcıNo\" =\'" + isimGirdisi + "\'";
                        
           Statement stmt2 = conn.createStatement();
           stmt2.executeUpdate(veriAkisi);
           System.out.println("Silme Başarılı...");

           //Bağlantı Sonlandırma.
            conn.close();
            stmt2.close();
            break;
                        
                        
        case 4 :
            //Girilecek değerler için tanımlanan değişkenler.
            
            String kullanıcıno , 
                   serSay , 
                   yetisBit ,
                   konum ;
                   
            System.out.print("Kullanıcı No Giriniz : ");
            Scanner d = new Scanner(System.in);
            kullanıcıno = d.nextLine();

            System.out.print("Sera Sayısı Giriniz : ");
            Scanner scan = new Scanner(System.in);
            serSay = scan.nextLine();

            System.out.print("Yetiştirilecek Bitkiyi Giriniz : ");
            Scanner t = new Scanner(System.in);
            yetisBit = t.nextLine();

            System.out.print("Seranın Konumunu Giriniz : ");
            Scanner a = new Scanner(System.in);
            konum = a.nextLine();

            veriAkisi ="INSERT INTO \"Kullanıcı\"\n(\"kullanıcıNo\", \"seraSayısı\","+ " \"yetiştirilenBitkiler\", \"seraKonumu\")"+ "\nVALUES ('" + kullanıcıno + "', '" + serSay +"', '" + yetisBit + "', '" + konum + "')";

            Statement stmt3 = conn.createStatement();
            stmt3.executeUpdate(veriAkisi);

            System.out.println("Ekleme Başarılı...");

            //Bağlantı Sonlandırma.
            conn.close();
            stmt3.close();
           
            break;
  
        case 5 :
            //Kullanıcı uygulamadan çıkamak istediğinde uygulamamızı kapatıyoruz.
            System.out.println("!!!PROGRAM KAPATILIYOR!!!");
            System.exit(0);
            break;

        default :
            //eğer menü ışında bir değer girilirse hata mesajı yazdırıyoruz.
            System.out.println("Hatali secim! 1, 2 ya da 3'e basiniz.");
            break;
        }
        
      }  
           
           catch (Exception e)
            {
                e.printStackTrace();
            }
        }
         
}
}
