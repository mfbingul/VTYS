/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package vtys.sera.sistemi;
import java.sql.*;

/**
 *
 * @author user
 */
public class DBsorgu {
    
    private static final DBsorgu sorgu = new DBsorgu();
    
    public static DBsorgu getSorgu(){
        
        return sorgu;
    
    }
        //sql deki kullanıcı adı ve şifrelerin atılacağı diziler bunlar.
            String kullaniciadi[];
            String kullanicisifresi[];
            
            int i = 0;
            int dSay = 0;
    public void sqlSorgu(){
 
        try
        {   //Bağlantı kurulumu.
            Connection conn = DriverManager.getConnection("jdbc:postgresql://localhost:5432/vtysdb","postgres","2391a3a2343b58d9.");
           
            if (conn != null)
                System.out.println("Veritabanına bağlandı!");
            else
                System.out.println("Bağlantı girişimi başarısız!");


            String sql= "SELECT \"kullaniciAdi\" , \"sifre\" FROM \"Üye\"";

            //Sorgu çalıştırma.
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            
            //Bağlantı sonlandırma.
            conn.close();

           String kullanici= null;
           String sifre=null;
            
           //Dizilerimizin uzunluğu.
            kullaniciadi = new String[150];
            kullanicisifresi = new String[150];
            
            while(rs.next())
            {
                //Kayda ait alan değerlerini değişkene atanıyor.
                kullanici  = rs.getString("kullaniciAdi");
                sifre = rs.getString("sifre");
             
                //Sql serverden çekilen kullanıcı adı ve şifreler diziye atanıyor.
                kullaniciadi[i] = kullanici;
                kullanicisifresi[i] = sifre;
                i++;

            }
           
            //Kaynakları serbest bırakıyor.
            rs.close();
            stmt.close();

        } 
        
        catch (Exception e) {
            e.printStackTrace();
        }
  
    }
    
    //Sql den çektiğimiz değerleri kullanıcının girdileri ile karşılaştırma.
    public void sorgulama(String x,String y){
            
        for(int z = 0 ; z<i; z++){
               
            //girilen değerlerle sql deki değerlerin karşılaştırılması.
                if(x.equals(kullaniciadi[z]) && y.equals(kullanicisifresi[z])){
                   //eğer girilen değerler eşleşiyorsa sayacımız artıyor.
                    dSay++;

                }
                
                } 
        //sayacımız bir e eşit oluğu zaman demek ki girilen değerler doğru ve ekrana bildirimi yazdırılır.
                if(dSay == 1)
                System.out.println("KULLANICI VE ŞİFRE DOĞRU!");
                   
   //eğer sayacımız 0 a eşitse demek ki girilen değerler eşleşmemiştir ekrana yanlış bildirimi yazdırılır.
               if(dSay==0){
                  System.out.println("KULLANICI VE ŞİFRE YANLIŞ!"); 
                  System.out.println("!!!PROGRAM KAPATILIYOR!!!");
                  System.exit(0);     
            }
              
            }
          
}
