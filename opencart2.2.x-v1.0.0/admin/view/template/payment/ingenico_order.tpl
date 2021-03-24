<h3>Ingenico Refund</h3>
 <?php if ($status == "success") { ?>
    <form id="form" class="form-horizontal">
     <input type="hidden" name="date" placeholder="dd-mm-YYYY" value="<?php echo $date; ?>" required/>
      Amount:   <input type="text" name="amount" placeholder="amount" value="<?php echo $amount; ?>" required/>
    <input type="hidden" name="token" placeholder="token" value="<?php echo $token; ?>" required/>  
      <input type="hidden" name="mrctCode" value="<?php echo $mcode; ?>"/>          
      <input type="hidden" name="currency" value="<?php echo $currency; ?>"/>          
         &nbsp; &nbsp; &nbsp;   <button id="btnSubmit" type="submit" class="btn btn-primary" name="submit" value="Submit" >Refund</button>
      </form><br>
      <p></p>
      <?php } else { ?>
      <h4>Refund Not Applicable</h4>
      <?php } ?>
<script>
$(document).ready(function(){
  $("#btnSubmit").click(function(e){
    e.preventDefault();
    var str = $("#form").serializeArray();

    function formatDate (dateString) {
   var p = dateString.split(/\D/g);
   return [p[2],p[1],p[0] ].join("-");
   }
var formatteddate= formatDate(str[0].value);
var amount = str[1].value;
var roundAmount = parseFloat(amount).toFixed(2);
    var data = {
   "merchant": {
    "identifier": str[3].value
  },
   "cart": {
  },
  "transaction": {
    "deviceIdentifier": "S",
    "amount": roundAmount,
    "currency": str[4].value,      
     "dateTime": formatteddate,
     "token": str[2].value,  
    "requestType": "R"
  }
};

var myJSON = JSON.stringify(data);
    
    $.ajax({
      type: 'POST',
      url: "https://www.paynimo.com/api/paynimoV2.req",
      data: myJSON,
      beforeSend: function() {
        $("p").html("");
        $("p").append('Loading......');
    },
      success: function(resultData) { 
       console.log(resultData);
        var statusmessage = resultData.paymentMethod.paymentTransaction.statusMessage ? resultData.paymentMethod.paymentTransaction.statusMessage : 'Refund Initiation Failed';
        
        var errormessage = resultData.paymentMethod.paymentTransaction.errorMessage ? resultData.paymentMethod.paymentTransaction.errorMessage : 'Refund Failed';
        
        $("p").html("");
         $("p").append('<p><b>Refund Status: </b>'+statusmessage+ '</p><p><b>Message: </b>'+errormessage+'</p>');
        
      }
});
  
  });
});
</script>