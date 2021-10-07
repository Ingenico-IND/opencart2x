<script type="text/javascript" src="https://www.paynimo.com/Paynimocheckout/server/lib/checkout.js"></script>
<div class="buttons">
  <div class="pull-right">
    <input type="button" value="<?php echo $button_confirm; ?>" id="button-confirm" class="btn btn-primary" />
  </div>
</div>
<div id="Worldlinepayment"></div>
<form action="<?php echo $returnUrl_2; ?>" id="response-form" method="POST">
<input type="hidden" name="msg" value="" id="response-string">
</form>
<script type="text/javascript"><!--
$('#button-confirm').on('click', function() {
    if (typeof $.pnCheckout != 'undefined'){

        if (<?php echo $enableExpressPay; ?>) {
            var enableExpressPay = true;
            } else {
            var enableExpressPay = false;    
            }

            if (<?php echo $enableNewWindowFlow; ?>) {
            var enableNewWindowFlow = true;
            } else {
            var enableNewWindowFlow = false;    
            }

            if (<?php echo $hideSavedInstruments; ?>) {
            var hideSavedInstruments = true;
            } else {
            var hideSavedInstruments = false;    
            }

            if (<?php echo $enableInstrumentDeRegistration; ?>) {
            var enableInstrumentDeRegistration = true;
            } else {
            var enableInstrumentDeRegistration = false;    
            }

            if (<?php echo $separateCardMode; ?>) {
            var separateCardMode = true;
            } else {
            var separateCardMode = false;    
            }

            if (<?php echo $saveInstrument; ?>) {
            var saveInstrument = true;
            } else {
            var saveInstrument = false;    
            }
    var configJson = {
                    'tarCall': false,
                    'features': {
                        'showLoader': true,
                        'showPGResponseMsg': true,
                        'enableNewWindowFlow': enableNewWindowFlow, //for hybrid applications please disable this by passing false
                        'enableExpressPay': enableExpressPay,
                        'enableAbortResponse': false,
                        'enableMerTxnDetails': true,
                        'hideSavedInstruments': hideSavedInstruments,
                        'enableInstrumentDeRegistration': enableInstrumentDeRegistration,
                        'separateCardMode': separateCardMode
                    },
                    'consumerData': {
                        'deviceId': 'WEBSH2',
                        'token': '<?php echo $token; ?>',
                        'returnUrl': '<?php echo $returnUrl; ?>',
                        'responseHandler': handleResponse,
                        'paymentMode': '<?php echo $paymentMode; ?>',
                        'merchantLogoUrl': '<?php echo $merchant_logo_url; ?>',  //provided merchant logo will be displayed
                        'merchantId': '<?php echo $mrctCode; ?>',
                        'currency': '<?php echo $currency; ?>',
                        'txnType': '<?php echo $txnType; ?>',
                        'txnSubType': 'DEBIT',
                        'checkoutElement': '<?php echo $checkoutElement; ?>',
                        'saveInstrument':saveInstrument,
                        'disclaimerMsg': '<?php echo $disclaimerMsg; ?>',
                        'merchantMsg': '<?php echo $merchantMsg; ?>',
                        'consumerId': '<?php echo $CustomerId; ?>',
                        'paymentModeOrder': [
                            '<?php echo $paymentModeOrder_1; ?>',
                            '<?php echo $paymentModeOrder_2; ?>',
                            '<?php echo $paymentModeOrder_3; ?>',
                            '<?php echo $paymentModeOrder_4; ?>',
                            '<?php echo $paymentModeOrder_5; ?>',
                            '<?php echo $paymentModeOrder_6; ?>',
                            '<?php echo $paymentModeOrder_7; ?>',
                            '<?php echo $paymentModeOrder_8; ?>',
                            '<?php echo $paymentModeOrder_9; ?>',
                            '<?php echo $paymentModeOrder_10; ?>'
                        ],
                        'consumerMobileNo': '<?php echo $customerMobNumber; ?>',
                        'consumerEmailId': '<?php echo $email; ?>',
                        'txnId': '<?php echo $merchantTxnRefNumber; ?>',   //Unique merchant transaction ID
                        'items': [{
                            'itemId': '<?php echo $scheme; ?>',
                            'amount': '<?php echo $Amount; ?>',
                            'comAmt': '0'
                        }],
                        'cartDescription': '}{custname:'+'<?php echo $fullname; ?>'+'}{orderid:'+'<?php echo $orderid; ?>',
                        'merRefDetails': [
                    {'name': 'Txn. Ref. ID', 'value': '<?php echo $merchantTxnRefNumber; ?>'}
                ],
                        'customStyle': {
                            'PRIMARY_COLOR_CODE': '<?php echo $primary_color_code; ?>',   //merchant primary color code
                            'SECONDARY_COLOR_CODE': '<?php echo $secondary_color_code; ?>',   //provide merchant's suitable color code
                            'BUTTON_COLOR_CODE_1': '<?php echo $button_color_code_1; ?>',   //merchant's button background color code
                            'BUTTON_COLOR_CODE_2': '<?php echo $button_color_code_2; ?>'   //provide merchant's suitable color code for button text
                        }
                    }
                };
                console.log(configJson);
                $.pnCheckout(configJson);
                if(configJson.features.enableNewWindowFlow){
                    pnCheckoutShared.openNewWindow();
                }

                function handleResponse(res) {
                if (typeof res != 'undefined' && typeof res.paymentMethod != 'undefined' && typeof res.paymentMethod.paymentTransaction != 'undefined' && typeof res.paymentMethod.paymentTransaction.statusCode != 'undefined' && res.paymentMethod.paymentTransaction.statusCode == '0300') {
                    // success block
                    let stringResponse = res.stringResponse;
                            console.log(stringResponse);
                            $("#response-string").val(stringResponse);
                            $("#response-form").submit();
                } else if (typeof res != 'undefined' && typeof res.paymentMethod != 'undefined' && typeof res.paymentMethod.paymentTransaction != 'undefined' && typeof res.paymentMethod.paymentTransaction.statusCode != 'undefined' && res.paymentMethod.paymentTransaction.statusCode == '0398') {
                    // initiated block
                } else {
                    // error block
                }
            };
        } else{
            alert('Processing Data, Please try again');
        }
});
//--></script>
