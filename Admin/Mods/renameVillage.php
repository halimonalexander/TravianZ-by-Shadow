<?php
#################################################################################
##              -= YOU MAY NOT REMOVE OR CHANGE THIS NOTICE =-                 ##
## --------------------------------------------------------------------------- ##
##  Filename       renameVillage.php                                           ##
##  Developed by:  aggenkeech                                                  ##
##  License:       TravianX Project                                            ##
##  Copyright:     TravianX (c) 2010-2011. All rights reserved.                ##
#################################################################################

include_once("../../Account.php");

if (!isset($_SESSION))
    session_start();
if ($_SESSION['access'] < ADMIN)
    die("Access Denied: You are not Admin!");

$did = $_POST['did'];
$name = $_POST['villagename'];
$sql = "UPDATE ".TB_PREFIX."vdata SET name = '$name' WHERE wref = $did";

$database->query($sql);

header("Location: ../../../Admin/admin.php?p=village&did=".$did."&name=".$name."");
