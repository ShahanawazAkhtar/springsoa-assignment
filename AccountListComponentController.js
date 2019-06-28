({
	doInit : function(component, event, helper) {
		helper.getAccounts(component, event);
	},
    
    showSpinner: function(component, event, helper) {
        component.set("v.Spinner", true); 
    },
    
    hideSpinner : function(component,event,helper){
        component.set("v.Spinner", false);
    }
})