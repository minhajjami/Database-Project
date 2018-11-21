
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.ResultSet;
import javax.swing.table.TableModel;
/**
 *
 * @author Anonymous
 */
public class DatabaseHandler {
    Connection connect = null;
    Statement statement = null;
    PreparedStatement pStatement = null;
    ResultSet result = null;
    
    public void setConnection() 
    {
        try
        {
            String dbName = "medisus_healthcare_database";
            String user = "root";
            String password = "";
            String url = "jdbc:mysql://localhost/" + dbName;

            Class.forName("com.mysql.jdbc.Driver");
            connect = (Connection) DriverManager.getConnection(url, user, password);

            System.out.println("Successfully Connected..");

        } 
        catch (Exception e)
        {
             System.out.println(e);
        }

    }
    public DatabaseMetaData getTableName()
    {
        try 
        {
            DatabaseMetaData md = connect.getMetaData();
            return md;
        } 
        catch (Exception e)
        {
            return null;
        }     
    }
    public ResultSet fetchTableData(String tbName) {

        try
        {
            String query = "SELECT * FROM "+tbName;
            statement = (Statement) connect.createStatement();
            result = statement.executeQuery(query);
           
            return result;
        }
        catch (Exception e)
        {
            System.out.println(e);
            return null;
        }
    }
    public boolean deleteData(String tb,String col,String data){
        try 
        {
            String query = "DELETE FROM "+tb+" WHERE "+col+"= '"+data+"'";
            pStatement = (PreparedStatement) connect.prepareStatement(query);
            pStatement.executeUpdate();
            return true;
        } 
        catch (Exception e) 
        {
            return false;
        }
    }
    public boolean insertDataIntoDoctor(String id,String name,String spe,String dep,String type,String chrg,String wh)
    {
        try{
            String query = "INSERT INTO doctor VALUES(?,?,?,?,?,?,?)";
            pStatement = (PreparedStatement) connect.prepareStatement(query);
            pStatement.setString(1, id);
            pStatement.setString(2, name);
            pStatement.setString(3, spe);
            pStatement.setString(4, dep);
            pStatement.setString(5, type);
            pStatement.setString(6, chrg);
            pStatement.setString(7, wh);
            pStatement.executeUpdate();
            return true;
        }catch(Exception e){
            return false;
        }
    }
    
    public boolean updateDataIntoDoctor(String id,String name,String spe,String dep,String type,String chrg,String wh)
    {
        try{
            String query = "update doctor set name='"+name+"',speciality='"+spe+"',department='"+dep+
                    "',type='"+type+"',charge='"+chrg+"',working_hour='"+wh+"' where doctor_id='"+id+"';";
            statement = (Statement) connect.createStatement();
            statement.executeUpdate(query);
            return true;
        }catch(Exception e){
            System.err.println(e);
            return false;
        }
    }
    public boolean insertDataIntoEmployee(String id,String name,int age,String sex,String qual,String exp,int salary,String cont)
    {
        try{
            String query = "INSERT INTO employee VALUES(?,?,?,?,?,?,?,?)";
            pStatement = (PreparedStatement) connect.prepareStatement(query);
            pStatement.setString(1, id);
            pStatement.setString(2, name);
            pStatement.setInt(3, age);
            pStatement.setString(4, sex);
            pStatement.setString(5, qual);
            pStatement.setString(6, exp);
            pStatement.setInt(7, salary);
            pStatement.setString(8, cont);
            pStatement.executeUpdate();
            return true;
        }catch(Exception e){
            return false;
        }
    }
    public boolean updateDataIntoEmployee(String id,String name,int age,String sex,String qual,String exp,int salary,String cont)
    {
        try{
            String query = "update employee set name='"+name+"',age="+age+",sex='"+sex+
                    "',qualification='"+qual+"',experience='"+exp+"',salary="+salary+",contact_number='"+cont+"' where employee_id='"+id+"';";
            statement = (Statement) connect.createStatement();
            statement.executeUpdate(query);
            return true;
        }catch(Exception e){
            System.err.println(e);
            return false;
        }
    }
    public ResultSet queryExecute(String query)
    {
        try
        {
            statement = (Statement) connect.createStatement();
            result = statement.executeQuery(query);
            return result;
        }
        catch (Exception e)
        {
            System.out.println(e);
            return null;
        }
    }
}
