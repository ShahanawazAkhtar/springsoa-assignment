trigger contactTrigger on Contact (after insert, after update, after delete, after undelete) {
    
    ContactTriggerHandler handler = new ContactTriggerHandler();
    
    if(trigger.isAfter){
        if(trigger.isInsert || trigger.isUndelete){
            handler.afterInsertUndelete(trigger.newMap);
        }
        if(trigger.isUpdate){
           handler.afterUpdate(trigger.newMap, trigger.oldMap); 
        }
        if(trigger.isDelete){
           handler.afterDelete(trigger.oldMap); 
        }
    }
}