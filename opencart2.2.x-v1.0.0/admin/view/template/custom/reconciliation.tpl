<?php  echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">    
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><?php echo $heading_title; ?></h3>
      </div>
      <div class="panel-body">
        <div class="container">
    <div class="row">
      <div class="text">
      
    </div>
    <meta charset = "UTF-8" />
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-payment" class="form-horizontal">

      From Date:    <input type="date" name="fromdate" placeholder="dd-mm-YYYY" required/>
     To Date:    <input type="date" name="todate" placeholder="dd-mm-YYYY" required/>  
      <input type="hidden" name="mrctCode" value="<?php echo $mrctCode; ?>"/>          
         &nbsp; &nbsp; &nbsp;   <button id="btnSubmit" type="submit" class="btn btn-primary" name="submit" value="Submit" >Submit</button>
      </form>
      <br>
    <br>
    <?php if(isset($message)) { ?>
      <p><?php echo $message; ?></p>
    <?php } ?>
    </div>
    <br>
    <br>
      </div>
    </div>
  </div>
</div>

<?php echo $footer; ?>