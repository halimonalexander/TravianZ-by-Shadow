<!---<?php
/*include("Templates/Plus/pmenu.tpl");
    $MyVilId = $database->query("SELECT * FROM ".TB_PREFIX."vdata WHERE `wref`='".$village->wid."'");
    $uuVilid = $this->db->fetchArray($MyVilId);
    $totalR = ($uuVilid['6']+$uuVilid['7']+$uuVilid['8']+$uuVilid['10']);
    $quart = ($totalR / 4);
	*/
?>

<form method="get" action="plus.php">
<input name="id" value="14" type="hidden"> 
<div align="center">
	<table border="1" width="50%" cellspacing="0" cellpadding="0">
		<tr>
			<td align="center" width="25%"><img class="r1" src="img/x.gif" alt="Lumber" title="Lumber" />Lumber</td>
			<td align="center" width="25%"><img class="r2" src="img/x.gif" alt="Clay" title="Clay" />Clay</td>
			<td align="center" width="25%"><img class="r3" src="img/x.gif" alt="Iron" title="Iron" />Iron</td>
			<td align="center" width="25%"><img class="r4" src="img/x.gif" alt="Crop" title="Crop" />Crop</td>
		</tr>
		<tr>
			<td align="center">
<?php
if($session->sit == 0) {
	/* $MyGold = $database->query("SELECT * FROM ".TB_PREFIX."users WHERE `id`='".$session->uid."'");
    $golds = $this->db->fetchArray($MyGold);

    $MyId = $database->query("SELECT * FROM ".TB_PREFIX."users WHERE `id`='".$session->uid."'");
    $uuid = $this->db->fetchArray($MyId);

	echo "<input type='text' name='T1' size='6' value=".$quart."></td>";
			echo "<td align='center'>";
	echo "<input type='text' name='T2' size='6' value=".$quart."></td>";
			echo "<td align='center'>";
	echo "<input type='text' name='T3' size='6' value=".$quart."></td>";
			echo "<td align='center'>";
	echo "<input type='text' name='T4' size='6' value=".$quart."></td>";
$database->query("UPDATE ".TB_PREFIX."users set gold = ".($session->gold-1)." where `id`='".$session->uid."'");
 */
}
?>
		</tr>
		<tr>
			<td colspan="4" align="center">
			<input type="submit" value="Trade 1:1" name="B1"></td>
		</tr>
	</table>
</div>
</form>-->