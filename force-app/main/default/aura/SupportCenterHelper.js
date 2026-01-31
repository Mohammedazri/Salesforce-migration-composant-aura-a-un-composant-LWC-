({
    loadTickets : function(component) {

        let action = component.get("c.getTickets");
        action.setParams({
            pageNumber : component.get("v.pageNumber"),
            pageSize   : component.get("v.pageSize")
        });

        action.setCallback(this, function(response) {
            if (response.getState() === "SUCCESS") {
                component.set("v.tickets", response.getReturnValue());
            } else {
                console.error('Error loading tickets');
            }
        });

        $A.enqueueAction(action);

        // Load total ticket count
        let totalAction = component.get("c.getTotalTickets");
        totalAction.setCallback(this, function(res) {
            if (res.getState() === "SUCCESS") {
                component.set("v.totalTickets", res.getReturnValue());
            }
        });

        $A.enqueueAction(totalAction);
    }
})
