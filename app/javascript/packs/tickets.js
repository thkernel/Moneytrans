$(document).on('turbolinks:load', function(){

    $("#ticket-items").on('change', 'select', function(event) {
              
        var target_id = event.target.id;
        var target_value = $("#"+target_id ).val();
        console.log("Value: ", target_value);
        console.log("ID: ",target_id)
        var array = target_id.split("_");
        var object_id = array[4];
        var field = array[5];
        console.log("Object ID: ",object_id );
        console.log("FIELD: ", field );
        //var customer_id = $("#order_customer_id").val();

        //console.log("ORDER CUSTOM: ", customer_id);
       

      
            $.ajax({
                type: "GET",
                headers: {
                        'X-CSRF-Token': document.querySelector("meta[name=csrf-token]").content
                        },
                dataType: 'json',
                url: "service",
                data: { data: target_value},     
                success: function(response) {
                    var _price = response.data.price;
                    var price = "ticket_ticket_items_attributes_" + object_id + "_price";
                    $("#"+price).val(_price);
                }
            });
       
        
        
    });


    $("#ticket-items").on('change', "input", function(event) {
        var target_id = event.target.id;
        var target_value = $("#"+target_id ).val();
        console.log("Value: ", target_value);
        console.log("ID: ",target_id)
        var array = target_id.split("_");
        var object_id = array[4];
        console.log("Object ID: ",object_id );

        // calcul
        //var discount = $("#order_order_items_attributes_" + object_id + "_discount").val();
        var price = $("#ticket_ticket_items_attributes_" + object_id + "_price").val();
        var total = "ticket_ticket_items_attributes_" + object_id + "_total";
     
        //var total_amount = (parseFloat((price )  * parseFloat(target_value)).toFixed(2)) - parseFloat(discount);
        var total_amount = parseFloat((price )  * parseFloat(target_value));
        $("#"+total).val(total_amount);
    });

    
    


    
});

//order_order_items_attributes_1642339613677_food_id