({
    doInit : function(component, event, helper) {
        helper.loadTickets(component);
    },

    nextPage : function(component, event, helper) {
        component.set("v.pageNumber", component.get("v.pageNumber") + 1);
        helper.loadTickets(component);
    },

    prevPage : function(component, event, helper) {
        component.set("v.pageNumber", component.get("v.pageNumber") - 1);
        helper.loadTickets(component);
    }
})
