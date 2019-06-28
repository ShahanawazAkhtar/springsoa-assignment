public class ContactTriggerHelper {
    
    public static void countContacts(Set<Id> acctIds){        
        List<Account> acctsToRollup = new List<Account>();
        try{
            for (AggregateResult ar : [SELECT AccountId AcctId, Count(id) ContactCount 
                                       FROM Contact 
                                       WHERE AccountId in: acctIds 
                                       GROUP BY AccountId]){
                                           Account a = new Account();
                                           a.Id = (Id) ar.get('AcctId'); 
                                           a.shanu__Total_contacts__c = (Integer) ar.get('ContactCount');
                                           acctsToRollup.add(a);
                                       }
            if(!acctsToRollup.isEmpty()){
                update acctsToRollup;
            }
        }catch(Exception e){
            system.debug('****Exception e-->'+e.getMessage()+' '+e.getLineNumber());  
        }
    }
}