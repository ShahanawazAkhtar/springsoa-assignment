public class ContactTriggerHandler {
    
    public void afterInsertUndelete(Map<Id, Contact> newMap){
        Set<Id> acctIds = new Set<Id>();
        for(Contact con : newMap.values()){
            if(con.AccountId != null){
                acctIds.add(con.AccountId);
            }
        }
        if(!acctIds.isEmpty()){
            ContactTriggerHelper.countContacts(acctIds);
        }
    }
    
    public void afterDelete(Map<Id, Contact> oldMap){
        Set<Id> acctIds = new Set<Id>();
        for(Contact con : oldMap.values()){
            if(con.AccountId != null){
                acctIds.add(con.AccountId);
            }
        }
        if(!acctIds.isEmpty()){
            ContactTriggerHelper.countContacts(acctIds);
        }
    }
    
    public void afterUpdate(Map<Id, Contact> newMap, Map<Id, Contact> oldMap){
        Set<Id> acctIds = new Set<Id>();
        for(Contact con : newMap.values()){
            if(con.AccountId != null && con.AccountId != oldMap.get(con.Id).AccountId){
                acctIds.add(con.AccountId);
                acctIds.add(oldMap.get(con.Id).AccountId);
            }
        }
        if(!acctIds.isEmpty()){
            ContactTriggerHelper.countContacts(acctIds);
        }
    }
}