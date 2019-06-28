({
    getAccounts: function(component, event){
        var action = component.get("c.getAccountList");
        action.setParams({
        });
        action.setCallback(this, function(response) {
            var state = response.getState();
            if (state === "SUCCESS") { 
                component.set("v.masterList", response.getReturnValue());
            }
        });
        $A.enqueueAction(action);
	}
})