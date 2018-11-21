
import java.sql.DatabaseMetaData;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.swing.DefaultComboBoxModel;
import javax.swing.JOptionPane;
import net.proteanit.sql.DbUtils;


/**
 *
 * @author Anonymous
 */
public class MainDashboard extends javax.swing.JFrame {

    DatabaseHandler databaseHandler;
    public MainDashboard() {
        initComponents();
        databaseHandler=new DatabaseHandler();
        databaseHandler.setConnection();
        showTable();
    }
    public MainDashboard(DatabaseHandler ob) {
        initComponents();
        databaseHandler=ob;
        showTable();
    }
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jLabel1 = new javax.swing.JLabel();
        tableList = new javax.swing.JComboBox<>();
        jScrollPane1 = new javax.swing.JScrollPane();
        infoTable = new javax.swing.JTable();
        jLabel2 = new javax.swing.JLabel();
        showInfo = new javax.swing.JButton();
        insertNewData = new javax.swing.JButton();
        deleteRec = new javax.swing.JButton();
        refreshBTN = new javax.swing.JButton();
        otherBTN = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.EXIT_ON_CLOSE);
        setPreferredSize(new java.awt.Dimension(1200, 700));

        jLabel1.setText("Table List");

        infoTable.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {

            }
        ));
        jScrollPane1.setViewportView(infoTable);

        jLabel2.setText("Table Information");

        showInfo.setText("Show Info");
        showInfo.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                showInfoActionPerformed(evt);
            }
        });

        insertNewData.setText("Insert/Update  Record");
        insertNewData.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                insertNewDataActionPerformed(evt);
            }
        });

        deleteRec.setText("Delete A Record");
        deleteRec.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                deleteRecActionPerformed(evt);
            }
        });

        refreshBTN.setText("Refresh Table Data");
        refreshBTN.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                refreshBTNActionPerformed(evt);
            }
        });

        otherBTN.setText("Others Information");
        otherBTN.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                otherBTNActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(97, 97, 97)
                .addComponent(jLabel1)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                    .addComponent(otherBTN, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                    .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING, false)
                        .addComponent(refreshBTN, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addComponent(deleteRec, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                        .addGroup(layout.createSequentialGroup()
                            .addComponent(tableList, javax.swing.GroupLayout.PREFERRED_SIZE, 165, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                            .addComponent(showInfo))
                        .addComponent(insertNewData, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)))
                .addGap(40, 40, 40)
                .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 708, Short.MAX_VALUE)
                .addContainerGap())
            .addGroup(javax.swing.GroupLayout.Alignment.TRAILING, layout.createSequentialGroup()
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addComponent(jLabel2)
                .addGap(303, 303, 303))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addGap(52, 52, 52)
                .addComponent(jLabel2)
                .addGap(18, 18, 18)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 486, Short.MAX_VALUE)
                    .addGroup(layout.createSequentialGroup()
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                            .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                                .addComponent(jLabel1)
                                .addComponent(tableList, javax.swing.GroupLayout.PREFERRED_SIZE, javax.swing.GroupLayout.DEFAULT_SIZE, javax.swing.GroupLayout.PREFERRED_SIZE))
                            .addComponent(showInfo))
                        .addGap(44, 44, 44)
                        .addComponent(insertNewData)
                        .addGap(35, 35, 35)
                        .addComponent(deleteRec)
                        .addGap(47, 47, 47)
                        .addComponent(refreshBTN)
                        .addGap(42, 42, 42)
                        .addComponent(otherBTN)
                        .addGap(0, 0, Short.MAX_VALUE)))
                .addContainerGap())
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void showInfoActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_showInfoActionPerformed
        // TODO add your handling code here:
        String tbName = tableList.getSelectedItem().toString();
        if(tbName.equalsIgnoreCase("Select A Table"))
        {
            JOptionPane.showMessageDialog(null,"Please select a table !!");
        }
        else
        {
            ResultSet rs = databaseHandler.fetchTableData(tbName);
            infoTable.setModel(DbUtils.resultSetToTableModel(rs));
        }
    }//GEN-LAST:event_showInfoActionPerformed

    private void insertNewDataActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_insertNewDataActionPerformed
        // TODO add your handling code here:
        String tbName = tableList.getSelectedItem().toString();
        if(tbName.equalsIgnoreCase("Select A Table"))
        {
            JOptionPane.showMessageDialog(null,"Please select a table !!");
        }
        else
        {
            if(tbName.equalsIgnoreCase("doctor"))
            {
                new DoctorInformation(databaseHandler).setVisible(true);
            }
            else if(tbName.equalsIgnoreCase("employee"))
            {
                new EmployeeInformation(databaseHandler).setVisible(true);
            }
            else
            {
                JOptionPane.showMessageDialog(null,"You Can't Insert/Update for this table by this option !!");
            }
        }
    }//GEN-LAST:event_insertNewDataActionPerformed

    private void deleteRecActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_deleteRecActionPerformed
        // TODO add your handling code here:
       int r = infoTable.getSelectedRow();
       if(r == -1)
       {
           JOptionPane.showMessageDialog(null,"Select A Data First");
       }
       else
       {
           String data = infoTable.getValueAt(r, 0).toString();
       
           String col = infoTable.getColumnName(0).toString();
           String tbName = tableList.getSelectedItem().toString();
           if(databaseHandler.deleteData(tbName, col, data))
           {
               JOptionPane.showMessageDialog(null,"Deleted !!");
           }
           else
           {
               JOptionPane.showMessageDialog(null,"Failed to Delete !!");
           }
        }
    }//GEN-LAST:event_deleteRecActionPerformed

    private void refreshBTNActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_refreshBTNActionPerformed
        // TODO add your handling code here:
        String tbName = tableList.getSelectedItem().toString();
        if(tbName.equalsIgnoreCase("Select A Table"))
        {
            JOptionPane.showMessageDialog(null,"Please select a table !!");
        }
        else
        {
            ResultSet rs = databaseHandler.fetchTableData(tbName);
            infoTable.setModel(DbUtils.resultSetToTableModel(rs));
        }
    }//GEN-LAST:event_refreshBTNActionPerformed

    private void otherBTNActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_otherBTNActionPerformed
        // TODO add your handling code here:
        this.setVisible(false);
        new OthersInformation(databaseHandler).setVisible(true);
    }//GEN-LAST:event_otherBTNActionPerformed

    /**
     * @param args the command line arguments
     */
    public static void main(String args[]) {
        /* Set the Nimbus look and feel */
        //<editor-fold defaultstate="collapsed" desc=" Look and feel setting code (optional) ">
        /* If Nimbus (introduced in Java SE 6) is not available, stay with the default look and feel.
         * For details see http://download.oracle.com/javase/tutorial/uiswing/lookandfeel/plaf.html 
         */
        try {
            for (javax.swing.UIManager.LookAndFeelInfo info : javax.swing.UIManager.getInstalledLookAndFeels()) {
                if ("Nimbus".equals(info.getName())) {
                    javax.swing.UIManager.setLookAndFeel(info.getClassName());
                    break;
                }
            }
        } catch (ClassNotFoundException ex) {
            java.util.logging.Logger.getLogger(MainDashboard.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            java.util.logging.Logger.getLogger(MainDashboard.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            java.util.logging.Logger.getLogger(MainDashboard.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        } catch (javax.swing.UnsupportedLookAndFeelException ex) {
            java.util.logging.Logger.getLogger(MainDashboard.class.getName()).log(java.util.logging.Level.SEVERE, null, ex);
        }
        //</editor-fold>

        /* Create and display the form */
        java.awt.EventQueue.invokeLater(new Runnable() {
            public void run() {
                new MainDashboard().setVisible(true);
            }
        });
    }
    
    public void showTable()
    {
         ArrayList<String> tbName = new ArrayList<String>();
         try 
         {
            DatabaseMetaData md = databaseHandler.getTableName();
            ResultSet rst = md.getTables(null, null, "%", null);
            tbName.add("Select A Table");
            while (rst.next()) 
            {
              tbName.add(rst.getString(3));
            }
            
            tableList.setModel(new DefaultComboBoxModel( tbName.toArray()));
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }       
    }
    

    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton deleteRec;
    private javax.swing.JTable infoTable;
    private javax.swing.JButton insertNewData;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JButton otherBTN;
    private javax.swing.JButton refreshBTN;
    private javax.swing.JButton showInfo;
    private javax.swing.JComboBox<String> tableList;
    // End of variables declaration//GEN-END:variables
}
