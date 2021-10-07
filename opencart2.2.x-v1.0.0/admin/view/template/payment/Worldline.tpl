<?php  echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-amazon-checkout" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if (is_array($error_warning) && count($error_warning) > 0) { 
    	foreach($error_warning as $error) { ?>
		    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error; ?>
		      <button type="button" class="close" data-dismiss="alert">&times;</button>
		    </div>
    <?php }} ?>
    <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_for_Worldline; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-amazon-checkout" class="form-horizontal">
          <div class="form-group">
              <label class="col-sm-2 control-label" for="input-desciption">Description</label>
              <div class="col-sm-10">
               Worldline ePayments is India's leading digital payment solutions company. 
                    Being a company with more than 45 years of global payment experience, we are present in India
                     for over 20 years and are powering over 550,000 businesses with our tailored payment solution.
              </div>
            </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-merchant"><?php echo $merchant_code; ?></label>
            <div class="col-sm-10">
              <input type="text" name="Worldline_merchant_code" value="<?php echo $Worldline_merchant_code; ?>" placeholder="<?php echo $merchant_code; ?>" id="input-merchant-code" class="form-control" />
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-merchant_scheme_code"><?php echo $merchant_scheme_code; ?></label>
            <div class="col-sm-10">
              <input type="text" name="Worldline_merchant_scheme_code" value="<?php echo $Worldline_merchant_scheme_code; ?>" placeholder="<?php echo $merchant_scheme_code; ?>" id="input-merchant_scheme_code" class="form-control" />
            </div>
          </div>
          
          
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-key">SALT</label>
            <div class="col-sm-10">
              <input type="text" name="Worldline_key" value="<?php echo $Worldline_key; ?>" placeholder="<?php echo $key; ?>" id="input-key" class="form-control" />
            </div>
          </div>
          
         
          
          <div class="form-group required" id="webservice_locator" >
            <label class="col-sm-2 control-label" for="input-mode">Type of Payment</label>
            <div class="col-sm-10">
              <select name="Worldline_webservice_locator" id="input-mode" class="form-control">
                <?php if ($Worldline_webservice_locator == 'Test') { ?>
                <option value="Test" selected="selected"><?php echo 'TEST'; ?></option>
                <?php } else { ?>
                <option value="Test"><?php echo 'TEST'; ?></option>
                <?php } ?>
                
                <?php if ($Worldline_webservice_locator == 'Live') { ?>
                <option value="Live" selected="selected"><?php echo 'LIVE'; ?></option>
                <?php } else { ?>
                <option value="Live"><?php echo 'LIVE'; ?></option>
                <?php } ?>
              </select>
                <br><p>For Test mode amount will be charged 1</p>              
            </div>
          </div>
          
          
          
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $status; ?></label>
            <div class="col-sm-10">
              <select name="Worldline_status" id="input-status" class="form-control">
                <?php if ($Worldline_status == "1") { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>
          
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-sort_order"><?php echo $sort_order; ?></label>
            <div class="col-sm-10">
              <?php if ($Worldline_sort_order != "") { ?>
              <input type="text" name="Worldline_sort_order" value="<?php echo $Worldline_sort_order; ?>" placeholder="<?php echo $sort_order; ?>" id="input-sort_order" class="form-control" />
              <?php } else { ?>
                <input type="text" name="Worldline_sort_order" value="1" placeholder="" id="input-sort_order" class="form-control" />
                <?php } ?>
            </div>
          </div>
          <div class="form-group">
              <label class="col-sm-2 control-label" for="input-Worldline_primary_color_code">Primary Color</label>
              <div class="col-sm-10">
                <?php if ($Worldline_primary_color_code != "") { ?>
                <input type="text" name="Worldline_primary_color_code" value="<?php echo $Worldline_primary_color_code; ?>" placeholder="" id="input-primary_color_code" class="form-control" />
                <?php } else { ?>
                  <input type="text" name="Worldline_primary_color_code" value="#3977b7" placeholder="" id="input-primary_color_code" class="form-control" />
                <?php } ?>
                <br><p>Color value can be hex, rgb or actual color name</p>
              </div>
            </div>
          <div class="form-group">
              <label class="col-sm-2 control-label" for="input-Worldline_secondary_color_code">Secondary Color</label>
              <div class="col-sm-10">
                <?php if ($Worldline_secondary_color_code != "") { ?>
                <input type="text" name="Worldline_secondary_color_code" value="<?php echo $Worldline_secondary_color_code; ?>" placeholder="" id="input-secondary_color_code" class="form-control" />
                <?php } else { ?>
                  <input type="text" name="Worldline_secondary_color_code" value="#FFFFFF" placeholder="" id="input-secondary_color_code" class="form-control" />
                <?php } ?>
                <br><p>Color value can be hex, rgb or actual color name</p>
              </div>
            </div>
           <div class="form-group">
              <label class="col-sm-2 control-label" for="input-Worldline_button_color_code_1">Button Color 1</label>
              <div class="col-sm-10">
                <?php if ($Worldline_button_color_code_1 != "") { ?>
                <input type="text" name="Worldline_button_color_code_1" value="<?php echo $Worldline_button_color_code_1; ?>" placeholder="" id="input-button_color_code_1" class="form-control" />
                <?php } else { ?>
                  <input type="text" name="Worldline_button_color_code_1" value="#1969bb" placeholder="" id="input-button_color_code_1" class="form-control" />
                <?php } ?>
                <br><p>Color value can be hex, rgb or actual color name</p>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-Worldline_button_color_code_2">Button Color 1</label>
              <div class="col-sm-10">
                <?php if ($Worldline_button_color_code_2 != "") { ?>
                <input type="text" name="Worldline_button_color_code_2" value="<?php echo $Worldline_button_color_code_2; ?>" placeholder="" id="input-button_color_code_2" class="form-control" />
                <?php } else { ?>
                  <input type="text" name="Worldline_button_color_code_2" value="#FFFFFF" placeholder="" id="input-button_color_code_2" class="form-control" />
                <?php } ?>
                <br><p>Color value can be hex, rgb or actual color name</p>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-Worldline_merchant_logo_url">Logo URL</label>
              <div class="col-sm-10">
                  <?php if ($Worldline_merchant_logo_url != "") { ?>
                <input type="text" name="Worldline_merchant_logo_url" value="<?php echo $Worldline_merchant_logo_url; ?>" placeholder="" id="input-Worldline_merchant_logo_url" class="form-control" />
                <?php } else { ?>
                <input type="text" name="Worldline_merchant_logo_url" value="https://www.paynimo.com/CompanyDocs/company-logo-md.png" placeholder="" id="input-Worldline_merchant_logo_url" class="form-control" />
                <?php } ?>
                <br><p>An absolute URL pointing to a logo image of merchant which will show on checkout popup</p>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-Worldline_enableExpressPay">Enable ExpressPay</label>
              <div class="col-sm-10">
                <select name="Worldline_enableExpressPay" id="input-status" class="form-control">
                  <?php if ($Worldline_enableExpressPay != "") { ?>
                  <?php if ($Worldline_enableExpressPay == "1") { ?>
                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                 <?php } ?>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option> 
                  <?php } ?>
                </select>
                <br><p>To enable saved payments set its value to yes</p>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-Worldline_separateCardMode">Separate Card Mode</label>
              <div class="col-sm-10">
                <select name="Worldline_separateCardMode" id="input-status" class="form-control">
                  <?php if ($Worldline_separateCardMode != "") { ?>
                  <?php if ($Worldline_separateCardMode == "1") { ?>
                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                 <?php } ?>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option> 
                  <?php } ?>
                </select>
                <br><p>If this feature is enabled checkout shows two separate payment mode(Credit Card and Debit Card)</p>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-Worldline_enableNewWindowFlow">Enable New Window Flow</label>
              <div class="col-sm-10">
                <select name="Worldline_enableNewWindowFlow" id="input-status" class="form-control">
                  <?php if ($Worldline_enableNewWindowFlow != "") { ?>
                  <?php if ($Worldline_enableNewWindowFlow == "1") { ?>
                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                 <?php } ?>
                  <?php } else { ?>
                  <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                  <option value="0"><?php echo $text_disabled; ?></option> 
                  <?php } ?>
                </select>
                <br><p>If this feature is enabled, then bank page will open in new window</p>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-Worldline_merchantMsg">Merrchant Message</label>
              <div class="col-sm-10">
                <input type="text" name="Worldline_merchantMsg" value="<?php echo $Worldline_merchantMsg; ?>" placeholder="" id="input-Worldline_merchantMsg" class="form-control" />
                <br><p>Customize message from merchant which will be shown to customer in checkout page</p>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-Worldline_disclaimerMsg">Disclaimer Message</label>
              <div class="col-sm-10">
                <input type="text" name="Worldline_disclaimerMsg" value="<?php echo $Worldline_disclaimerMsg; ?>" placeholder="" id="input-Worldline_disclaimerMsg" class="form-control" />
                <br><p>Customize disclaimer message from merchant which will be shown to customer in checkout page</p>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-Worldline_paymentMode">Payment Mode</label>
              <div class="col-sm-10">
                <select name="Worldline_paymentMode" id="input-status" class="form-control">
                  <?php if ($Worldline_paymentMode != "") { ?>
                  <option value="<?php echo $Worldline_paymentMode; ?>" selected="selected"><?php echo $Worldline_paymentMode; ?></option> 
                  <option value="all">all</option> 
                  <option value="cards">cards</option>
                  <option value="netBanking">netBanking</option>
                  <option value="UPI">UPI</option>
                  <option value="imps">imps</option>
                  <option value="wallets">wallets</option>
                  <option value="cashCards">cashCards</option>
                  <option value="NEFTRTGS">NEFTRTGS</option>
                  <option value="emiBanks">emiBanks</option>
                  <?php } else { ?>
                  <option value="all" selected="selected">all</option> 
                  <option value="cards">cards</option>
                  <option value="netBanking">netBanking</option>
                  <option value="UPI">UPI</option>
                  <option value="imps">imps</option>
                  <option value="wallets">wallets</option>
                  <option value="cashCards">cashCards</option>
                  <option value="NEFTRTGS">NEFTRTGS</option>
                  <option value="emiBanks">emiBanks</option>
                  <?php } ?>
                </select>
                <br><p>If Bank selection is at Worldline ePayments India Pvt. Ltd. 
                        end then select all, if bank selection at Merchant end then pass 
                        appropriate mode respective to selected option</p>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-Worldline_paymentModeOrder">Payment Mode Order</label>
              <div class="col-sm-10">
                  <?php if ($Worldline_paymentModeOrder != "") { ?>

                <textarea type="text" name="Worldline_paymentModeOrder" value="<?php echo $Worldline_paymentModeOrder; ?>" placeholder="" id="input-Worldline_paymentModeOrder" class="form-control"><?php echo $Worldline_paymentModeOrder; ?></textarea>
                <?php } else { ?>
                  <textarea type="text" name="Worldline_paymentModeOrder" value="wallets,cards,netBanking,imps,cashCards,UPI,MVISA,debitPin,NEFTRTGS,emiBanks" placeholder="" id="input-Worldline_paymentModeOrder" class="form-control">wallets,cards,netBanking,imps,cashCards,UPI,MVISA,debitPin,NEFTRTGS,emiBanks</textarea>
                  <?php } ?>
                  <br><p>Please pass order in this format: cards,netBanking,imps,wallets,cashCards,UPI,MVISA,debitPin,NEFTRTGS,emiBanks. 
                  Merchant can define their payment mode order</p>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-Worldline_enableInstrumentDeRegistration">Enable InstrumentDeRegistration</label>
              <div class="col-sm-10">
                <select name="Worldline_enableInstrumentDeRegistration" id="input-status" class="form-control">
                  <?php if ($Worldline_enableInstrumentDeRegistration != "") { ?>
                  <?php if ($Worldline_enableInstrumentDeRegistration == "1") { ?>
                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option> 
                  <?php } ?> 
                </select>
                <br><p>If this feature is enabled, you will have an option to delete saved cards</p>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-Worldline_txnType">Transaction Type</label>
              <div class="col-sm-10">
                <select name="Worldline_txnType" id="input-status" class="form-control">
                  <option value="SALE" selected="selected">SALE</option>
                </select>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-Worldline_hideSavedInstruments">Hide SavedInstruments</label>
              <div class="col-sm-10">
                <select name="Worldline_hideSavedInstruments" id="input-status" class="form-control">
                  <?php if ($Worldline_hideSavedInstruments != "") { ?>
                  <?php if ($Worldline_hideSavedInstruments == "1") { ?>
                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option> 
                  <?php } ?> 
                </select>
                <br><p>If enabled checkout hides saved payment options even in case of enableExpressPay is enabled.</p>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-Worldline_saveInstrument">Save Instrument</label>
              <div class="col-sm-10">
                <select name="Worldline_saveInstrument" id="input-status" class="form-control">
                <?php if ($Worldline_saveInstrument != "") { ?>
                 <?php if ($Worldline_saveInstrument == "1") { ?>
                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option> 
                  <?php } ?>  
                </select>
                <br><p>Enable this feature to vault instrument</p>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-Worldline_displayErrorMessageOnPopup">Display Transaction Message on Popup</label>
              <div class="col-sm-10">
                <select name="Worldline_displayErrorMessageOnPopup" id="input-status" class="form-control">
                  <?php if ($Worldline_displayErrorMessageOnPopup != "") { ?>
                  <?php if ($Worldline_displayErrorMessageOnPopup == "1") { ?>
                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option> 
                  <?php } ?>
                </select>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-Worldline_embedPaymentGatewayOnPage">Embed Payment Gateway On Page</label>
              <div class="col-sm-10">
                <select name="Worldline_embedPaymentGatewayOnPage" id="input-status" class="form-control">
                  <?php if ($Worldline_embedPaymentGatewayOnPage != "") { ?>
                  <?php if ($Worldline_embedPaymentGatewayOnPage == "1") { ?>
                    <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                    <option value="0"><?php echo $text_disabled; ?></option>
                  <?php } else { ?>
                    <option value="1"><?php echo $text_enabled; ?></option>
                    <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                  <?php } ?>
                  <?php } else { ?>
                  <option value="1"><?php echo $text_enabled; ?></option>
                  <option value="0" selected="selected"><?php echo $text_disabled; ?></option> 
                  <?php } ?>
                </select>
              </div>
            </div>
            <div class="form-group">
              <label class="col-sm-2 control-label" for="input-verification"><a href="<?php echo $verification; ?>" target="_blank">Offline Verification</a></label>  
                   
              <label class="col-sm-1 control-label" for="input-reconciliation"><a href="<?php echo $reconciliation; ?>" target="_blank">Reconciliation</a></label>
           
            </div>
          </fieldset>
        </form>
      </div>
    </div>
  </div>
</div>  
<?php echo $footer; ?>