@isTest
public class TestContactHandler {
    
    @testSetup 
    public static void testSetup() {
        List<Account> accList = new List<Account>();
        Account acc1 = new Account();
        acc1.Name = 'Test 1';
        accList.add(acc1);
        
        Account acc2 = new Account();
        acc2.Name = 'Test 2';
        accList.add(acc2);
        insert accList;
        
        List<Contact> conList = new List<Contact>();
        Contact con1 = new Contact();
        con1.LastName = 'Test Con 1';
        con1.AccountId = accList[0].Id;
        conList.add(con1);
        
        Contact con2 = new Contact();
        con2.LastName = 'Test Con 2';
        con2.AccountId = accList[0].Id;
        conList.add(con2);
        
        Contact con3 = new Contact();
        con3.LastName = 'Test Con 3';
        con3.AccountId = accList[1].Id;
        conList.add(con3);
        
        Contact con4 = new Contact();
        con4.LastName = 'Test Con 4';
        con4.AccountId = accList[1].Id;
        conList.add(con4);
         
        insert conList;
    }
    
    public static TestMethod void testContactDelete(){
        Contact con = [Select id From Contact Where LastName = 'Test Con 1'];
        delete con;
        
        Account acc = [Select id, shanu__Total_contacts__c From Account Where Name = 'Test 1'];
        system.assertEquals(1, acc.shanu__Total_contacts__c);
    }
    
    public static TestMethod void testContactUpdate(){
        Account acc = [Select id, shanu__Total_contacts__c From Account Where Name = 'Test 2'];
        Contact con = [Select id From Contact Where LastName = 'Test Con 1'];
        con.AccountId = acc.Id;
        update con;
        
        Account accRes1 = [Select id, shanu__Total_contacts__c From Account Where Name = 'Test 2'];
        system.assertEquals(3, accRes1.shanu__Total_contacts__c);
        
        Account accRes2 = [Select id, shanu__Total_contacts__c From Account Where Name = 'Test 1'];
        system.assertEquals(1, accRes2.shanu__Total_contacts__c);
    }

}