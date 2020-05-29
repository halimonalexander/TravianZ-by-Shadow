<body>
    <div id="build" class="gid27">
        <a href="#" onclick="return Popup(27,4);" class="build_logo"><img class="building g27" src="img/x.gif" alt="Treasury" title="<?php echo TREASURY; ?>"></a>

        <h1><?php echo TREASURY; ?> <span class="level"><?php echo LEVEL; ?> <?php

        echo $Account->resarray['f' . $id];

?></span></h1>

        <p class="build_desc"><?php echo TREASURY_DESC; ?></p>
        
        <?php

        include("27_menu.tpl");

?>
        
        <table id="show_artefacts" cellpadding="1" cellspacing="1">
    		<thead>
    			<tr>
			    	<th colspan="4"><?php echo LARGE_ARTIFACTS; ?></th>
    			</tr>
    			<tr>
    				<td></td>
	    			<td><?php echo NAME; ?></td>
	    			<td><?php echo PLAYER; ?></td>
	    			<td><?php echo ALLIANCE; ?></td>
    			</tr>
    		</thead>
    		<tbody>
            <?php

        if($this->database->numRows($this->database->query("SELECT * FROM " . TB_PREFIX . "artefacts")) == 0) {
        	echo '<td colspan="4" class="none">'.NO_ARTIFACTS.'</td>';
        } else {

        	$artefact = $this->database->query("SELECT * FROM `" . TB_PREFIX . "artefacts` WHERE size = 2 AND type = 1");
        	while($row = $this->database->fetchArray($artefact)) {
        		echo '<tr>';
        		echo '<td class="icon"><img class="artefact_icon_' . $row['type'] . '" src="img/x.gif" alt="" title=""></td>';
        		echo '<td class="nam">';
        		echo '<a href="'.\App\Routes::BUILD.'?id=' . $id . '&show='.$row['id'].'">' . $row['name'] . '</a> <span class="bon">' . $row['effect'] . '</span><div class="info">'.TREASURY.' <b>20</b>, '.EFFECT.' <b>'.ACCOUNT.'</b></div>';
        		echo '</td>';
        		echo '<td class="pla"><a href="'  . \App\Routes::MAP . '?d=' . $row['vref'] . '&c=' . $generator->getMapCheck($row['vref']) . '">' . $this->database->getUserField($row['owner'], "username", 0) . '</a></td>';
        		echo '<td class="al"><a href="allianz.php?aid=' . $this->database->getUserField($row['owner'], "alliance", 0) . '">' . $this->database->getAllianceName($this->database->getUserField($row['owner'], "alliance", 0)) . '</a></td>';
        		echo '</tr>';
        	}

        	unset($artefact);
        	unset($row);
        	$artefact = $this->database->query("SELECT * FROM `" . TB_PREFIX . "artefacts` WHERE size = 3 AND type = 1");
        	while($row = $this->database->fetchArray($artefact)) {
        		echo '<tr>';
        		echo '<td class="icon"><img class="artefact_icon_' . $row['type'] . '" src="img/x.gif" alt="" title=""></td>';
        		echo '<td class="nam">';
        		echo '<a href="'.\App\Routes::BUILD.'?id=' . $id . '&show='.$row['id'].'">' . $row['name'] . '</a> <span class="bon">' . $row['effect'] . '</span><div class="info">'.TREASURY.' <b>20</b>, '.EFFECT.' <b>'.ACCOUNT.'</b></div>';
        		echo '</td>';
        		echo '<td class="pla"><a href="'  . \App\Routes::MAP . '?d=' . $row['vref'] . '&c=' . $generator->getMapCheck($row['vref']) . '">' . $this->database->getUserField($row['owner'], "username", 0) . '</a></td>';
        		echo '<td class="al"><a href="allianz.php?aid=' . $this->database->getUserField($row['owner'], "alliance", 0) . '">' . $this->database->getAllianceName($this->database->getUserField($row['owner'], "alliance", 0)) . '</a></td>';
        		echo '</tr>';
        	}

?>
            <tr><td colspan="4"></td></tr>
            
            
            <?php

        	unset($artefact);
        	unset($row);
        	$artefact = $this->database->query("SELECT * FROM `" . TB_PREFIX . "artefacts` WHERE size = 2 AND type = 2");
        	while($row = $this->database->fetchArray($artefact)) {
        		echo '<tr>';
        		echo '<td class="icon"><img class="artefact_icon_' . $row['type'] . '" src="img/x.gif" alt="" title=""></td>';
        		echo '<td class="nam">';
        		echo '<a href="'.\App\Routes::BUILD.'?id=' . $id . '&show='.$row['id'].'">' . $row['name'] . '</a> <span class="bon">' . $row['effect'] . '</span><div class="info">'.TREASURY.' <b>20</b>, '.EFFECT.' <b>'.ACCOUNT.'</b></div>';
        		echo '</td>';
        		echo '<td class="pla"><a href="'  . \App\Routes::MAP . '?d=' . $row['vref'] . '&c=' . $generator->getMapCheck($row['vref']) . '">' . $this->database->getUserField($row['owner'], "username", 0) . '</a></td>';
        		echo '<td class="al"><a href="allianz.php?aid=' . $this->database->getUserField($row['owner'], "alliance", 0) . '">' . $this->database->getAllianceName($this->database->getUserField($row['owner'], "alliance", 0)) . '</a></td>';
        		echo '</tr>';
        	}

        	unset($artefact);
        	unset($row);
        	$artefact = $this->database->query("SELECT * FROM `" . TB_PREFIX . "artefacts` WHERE size = 3 AND type = 2");
        	while($row = $this->database->fetchArray($artefact)) {
        		echo '<tr>';
        		echo '<td class="icon"><img class="artefact_icon_' . $row['type'] . '" src="img/x.gif" alt="" title=""></td>';
        		echo '<td class="nam">';
        		echo '<a href="'.\App\Routes::BUILD.'?id=' . $id . '&show='.$row['id'].'">' . $row['name'] . '</a> <span class="bon">' . $row['effect'] . '</span><div class="info">'.TREASURY.' <b>20</b>, '.EFFECT.' <b>'.ACCOUNT.'</b></div>';
        		echo '</td>';
        		echo '<td class="pla"><a href="'  . \App\Routes::MAP . '?d=' . $row['vref'] . '&c=' . $generator->getMapCheck($row['vref']) . '">' . $this->database->getUserField($row['owner'], "username", 0) . '</a></td>';
        		echo '<td class="al"><a href="allianz.php?aid=' . $this->database->getUserField($row['owner'], "alliance", 0) . '">' . $this->database->getAllianceName($this->database->getUserField($row['owner'], "alliance", 0)) . '</a></td>';
        		echo '</tr>';
        	}

?>
            <tr><td colspan="4"></td></tr>
            
            
            <?php

        	unset($artefact);
        	unset($row);
        	$artefact = $this->database->query("SELECT * FROM `" . TB_PREFIX . "artefacts` WHERE size = 2 AND type = 3");
        	while($row = $this->database->fetchArray($artefact)) {
        		echo '<tr>';
        		echo '<td class="icon"><img class="artefact_icon_' . $row['type'] . '" src="img/x.gif" alt="" title=""></td>';
        		echo '<td class="nam">';
        		echo '<a href="'.\App\Routes::BUILD.'?id=' . $id . '&show='.$row['id'].'">' . $row['name'] . '</a> <span class="bon">' . $row['effect'] . '</span><div class="info">'.TREASURY.' <b>20</b>, '.EFFECT.' <b>'.ACCOUNT.'</b></div>';
        		echo '</td>';
        		echo '<td class="pla"><a href="'  . \App\Routes::MAP . '?d=' . $row['vref'] . '&c=' . $generator->getMapCheck($row['vref']) . '">' . $this->database->getUserField($row['owner'], "username", 0) . '</a></td>';
        		echo '<td class="al"><a href="allianz.php?aid=' . $this->database->getUserField($row['owner'], "alliance", 0) . '">' . $this->database->getAllianceName($this->database->getUserField($row['owner'], "alliance", 0)) . '</a></td>';
        		echo '</tr>';
        	}

        	unset($artefact);
        	unset($row);
        	$artefact = $this->database->query("SELECT * FROM `" . TB_PREFIX . "artefacts` WHERE size = 3 AND type = 3");
        	while($row = $this->database->fetchArray($artefact)) {
        		echo '<tr>';
        		echo '<td class="icon"><img class="artefact_icon_' . $row['type'] . '" src="img/x.gif" alt="" title=""></td>';
        		echo '<td class="nam">';
        		echo '<a href="'.\App\Routes::BUILD.'?id=' . $id . '&show='.$row['id'].'">' . $row['name'] . '</a> <span class="bon">' . $row['effect'] . '</span><div class="info">'.TREASURY.' <b>20</b>, '.EFFECT.' <b>'.ACCOUNT.'</b></div>';
        		echo '</td>';
        		echo '<td class="pla"><a href="'  . \App\Routes::MAP . '?d=' . $row['vref'] . '&c=' . $generator->getMapCheck($row['vref']) . '">' . $this->database->getUserField($row['owner'], "username", 0) . '</a></td>';
        		echo '<td class="al"><a href="allianz.php?aid=' . $this->database->getUserField($row['owner'], "alliance", 0) . '">' . $this->database->getAllianceName($this->database->getUserField($row['owner'], "alliance", 0)) . '</a></td>';
        		echo '</tr>';
        	}

?>
            <tr><td colspan="4"></td></tr>
            
            
            <?php

        	unset($artefact);
        	unset($row);
        	$artefact = $this->database->query("SELECT * FROM `" . TB_PREFIX . "artefacts` WHERE size = 2 AND type = 4");
        	while($row = $this->database->fetchArray($artefact)) {
        		echo '<tr>';
        		echo '<td class="icon"><img class="artefact_icon_' . $row['type'] . '" src="img/x.gif" alt="" title=""></td>';
        		echo '<td class="nam">';
        		echo '<a href="'.\App\Routes::BUILD.'?id=' . $id . '&show='.$row['id'].'">' . $row['name'] . '</a> <span class="bon">' . $row['effect'] . '</span><div class="info">'.TREASURY.' <b>20</b>, '.EFFECT.' <b>'.ACCOUNT.'</b></div>';
        		echo '</td>';
        		echo '<td class="pla"><a href="'  . \App\Routes::MAP . '?d=' . $row['vref'] . '&c=' . $generator->getMapCheck($row['vref']) . '">' . $this->database->getUserField($row['owner'], "username", 0) . '</a></td>';
        		echo '<td class="al"><a href="allianz.php?aid=' . $this->database->getUserField($row['owner'], "alliance", 0) . '">' . $this->database->getAllianceName($this->database->getUserField($row['owner'], "alliance", 0)) . '</a></td>';
        		echo '</tr>';
        	}

        	unset($artefact);
        	unset($row);
        	$artefact = $this->database->query("SELECT * FROM `" . TB_PREFIX . "artefacts` WHERE size = 3 AND type = 4");
        	while($row = $this->database->fetchArray($artefact)) {
        		echo '<tr>';
        		echo '<td class="icon"><img class="artefact_icon_' . $row['type'] . '" src="img/x.gif" alt="" title=""></td>';
        		echo '<td class="nam">';
        		echo '<a href="'.\App\Routes::BUILD.'?id=' . $id . '&show='.$row['id'].'">' . $row['name'] . '</a> <span class="bon">' . $row['effect'] . '</span><div class="info">'.TREASURY.' <b>20</b>, '.EFFECT.' <b>'.ACCOUNT.'</b></div>';
        		echo '</td>';
        		echo '<td class="pla"><a href="'  . \App\Routes::MAP . '?d=' . $row['vref'] . '&c=' . $generator->getMapCheck($row['vref']) . '">' . $this->database->getUserField($row['owner'], "username", 0) . '</a></td>';
        		echo '<td class="al"><a href="allianz.php?aid=' . $this->database->getUserField($row['owner'], "alliance", 0) . '">' . $this->database->getAllianceName($this->database->getUserField($row['owner'], "alliance", 0)) . '</a></td>';
        		echo '</tr>';
        	}

?>
            <tr><td colspan="4"></td></tr>
            
            <?php

        	unset($artefact);
        	unset($row);
        	$artefact = $this->database->query("SELECT * FROM `" . TB_PREFIX . "artefacts` WHERE size = 2 AND type = 5");
        	while($row = $this->database->fetchArray($artefact)) {
        		echo '<tr>';
        		echo '<td class="icon"><img class="artefact_icon_' . $row['type'] . '" src="img/x.gif" alt="" title=""></td>';
        		echo '<td class="nam">';
        		echo '<a href="'.\App\Routes::BUILD.'?id=' . $id . '&show='.$row['id'].'">' . $row['name'] . '</a> <span class="bon">' . $row['effect'] . '</span><div class="info">'.TREASURY.' <b>20</b>, '.EFFECT.' <b>'.ACCOUNT.'</b></div>';
        		echo '</td>';
        		echo '<td class="pla"><a href="'  . \App\Routes::MAP . '?d=' . $row['vref'] . '&c=' . $generator->getMapCheck($row['vref']) . '">' . $this->database->getUserField($row['owner'], "username", 0) . '</a></td>';
        		echo '<td class="al"><a href="allianz.php?aid=' . $this->database->getUserField($row['owner'], "alliance", 0) . '">' . $this->database->getAllianceName($this->database->getUserField($row['owner'], "alliance", 0)) . '</a></td>';
        		echo '</tr>';
        	}

        	unset($artefact);
        	unset($row);
        	$artefact = $this->database->query("SELECT * FROM `" . TB_PREFIX . "artefacts` WHERE size = 3 AND type = 5");
        	while($row = $this->database->fetchArray($artefact)) {
        		echo '<tr>';
        		echo '<td class="icon"><img class="artefact_icon_' . $row['type'] . '" src="img/x.gif" alt="" title=""></td>';
        		echo '<td class="nam">';
        		echo '<a href="'.\App\Routes::BUILD.'?id=' . $id . '&show='.$row['id'].'">' . $row['name'] . '</a> <span class="bon">' . $row['effect'] . '</span><div class="info">'.TREASURY.' <b>20</b>, '.EFFECT.' <b>'.ACCOUNT.'</b></div>';
        		echo '</td>';
        		echo '<td class="pla"><a href="'  . \App\Routes::MAP . '?d=' . $row['vref'] . '&c=' . $generator->getMapCheck($row['vref']) . '">' . $this->database->getUserField($row['owner'], "username", 0) . '</a></td>';
        		echo '<td class="al"><a href="allianz.php?aid=' . $this->database->getUserField($row['owner'], "alliance", 0) . '">' . $this->database->getAllianceName($this->database->getUserField($row['owner'], "alliance", 0)) . '</a></td>';
        		echo '</tr>';
        	}

?>
            <tr><td colspan="4"></td></tr>
            
            <?php

        	unset($artefact);
        	unset($row);
        	$artefact = $this->database->query("SELECT * FROM `" . TB_PREFIX . "artefacts` WHERE size = 2 AND type = 6");
        	while($row = $this->database->fetchArray($artefact)) {
        		echo '<tr>';
        		echo '<td class="icon"><img class="artefact_icon_' . $row['type'] . '" src="img/x.gif" alt="" title=""></td>';
        		echo '<td class="nam">';
        		echo '<a href="'.\App\Routes::BUILD.'?id=' . $id . '&show='.$row['id'].'">' . $row['name'] . '</a> <span class="bon">' . $row['effect'] . '</span><div class="info">'.TREASURY.' <b>20</b>, '.EFFECT.' <b>'.ACCOUNT.'</b></div>';
        		echo '</td>';
        		echo '<td class="pla"><a href="'  . \App\Routes::MAP . '?d=' . $row['vref'] . '&c=' . $generator->getMapCheck($row['vref']) . '">' . $this->database->getUserField($row['owner'], "username", 0) . '</a></td>';
        		echo '<td class="al"><a href="allianz.php?aid=' . $this->database->getUserField($row['owner'], "alliance", 0) . '">' . $this->database->getAllianceName($this->database->getUserField($row['owner'], "alliance", 0)) . '</a></td>';
        		echo '</tr>';
        	}

        	unset($artefact);
        	unset($row);
        	$artefact = $this->database->query("SELECT * FROM `" . TB_PREFIX . "artefacts` WHERE size = 3 AND type = 6");
        	while($row = $this->database->fetchArray($artefact)) {
        		echo '<tr>';
        		echo '<td class="icon"><img class="artefact_icon_' . $row['type'] . '" src="img/x.gif" alt="" title=""></td>';
        		echo '<td class="nam">';
        		echo '<a href="'.\App\Routes::BUILD.'?id=' . $id . '&show='.$row['id'].'">' . $row['name'] . '</a> <span class="bon">' . $row['effect'] . '</span><div class="info">'.TREASURY.' <b>20</b>, '.EFFECT.' <b>'.ACCOUNT.'</b></div>';
        		echo '</td>';
        		echo '<td class="pla"><a href="'  . \App\Routes::MAP . '?d=' . $row['vref'] . '&c=' . $generator->getMapCheck($row['vref']) . '">' . $this->database->getUserField($row['owner'], "username", 0) . '</a></td>';
        		echo '<td class="al"><a href="allianz.php?aid=' . $this->database->getUserField($row['owner'], "alliance", 0) . '">' . $this->database->getAllianceName($this->database->getUserField($row['owner'], "alliance", 0)) . '</a></td>';
        		echo '</tr>';
        	}

?>
            <tr><td colspan="4"></td></tr>
            
            <?php

        	unset($artefact);
        	unset($row);
        	$artefact = $this->database->query("SELECT * FROM `" . TB_PREFIX . "artefacts` WHERE size = 2 AND type = 7");
        	while($row = $this->database->fetchArray($artefact)) {
        		echo '<tr>';
        		echo '<td class="icon"><img class="artefact_icon_' . $row['type'] . '" src="img/x.gif" alt="" title=""></td>';
        		echo '<td class="nam">';
        		echo '<a href="'.\App\Routes::BUILD.'?id=' . $id . '&show='.$row['id'].'">' . $row['name'] . '</a> <span class="bon">' . $row['effect'] . '</span><div class="info">'.TREASURY.' <b>20</b>, '.EFFECT.' <b>'.ACCOUNT.'</b></div>';
        		echo '</td>';
        		echo '<td class="pla"><a href="'  . \App\Routes::MAP . '?d=' . $row['vref'] . '&c=' . $generator->getMapCheck($row['vref']) . '">' . $this->database->getUserField($row['owner'], "username", 0) . '</a></td>';
        		echo '<td class="al"><a href="allianz.php?aid=' . $this->database->getUserField($row['owner'], "alliance", 0) . '">' . $this->database->getAllianceName($this->database->getUserField($row['owner'], "alliance", 0)) . '</a></td>';
        		echo '</tr>';
        	}

        	unset($artefact);
        	unset($row);
        	$artefact = $this->database->query("SELECT * FROM `" . TB_PREFIX . "artefacts` WHERE size = 3 AND type = 7");
        	while($row = $this->database->fetchArray($artefact)) {
        		echo '<tr>';
        		echo '<td class="icon"><img class="artefact_icon_' . $row['type'] . '" src="img/x.gif" alt="" title=""></td>';
        		echo '<td class="nam">';
        		echo '<a href="'.\App\Routes::BUILD.'?id=' . $id . '&show='.$row['id'].'">' . $row['name'] . '</a> <span class="bon">' . $row['effect'] . '</span><div class="info">'.TREASURY.' <b>20</b>, '.EFFECT.' <b>'.ACCOUNT.'</b></div>';
        		echo '</td>';
        		echo '<td class="pla"><a href="'  . \App\Routes::MAP . '?d=' . $row['vref'] . '&c=' . $generator->getMapCheck($row['vref']) . '">' . $this->database->getUserField($row['owner'], "username", 0) . '</a></td>';
        		echo '<td class="al"><a href="allianz.php?aid=' . $this->database->getUserField($row['owner'], "alliance", 0) . '">' . $this->database->getAllianceName($this->database->getUserField($row['owner'], "alliance", 0)) . '</a></td>';
        		echo '</tr>';
        	}

?>
            <tr><td colspan="4"></td></tr>
            
            <?php

        	unset($artefact);
        	unset($row);
        	$artefact = $this->database->query("SELECT * FROM `" . TB_PREFIX . "artefacts` WHERE size = 3 AND type = 8");
        	while($row = $this->database->fetchArray($artefact)) {
        		echo '<tr>';
        		echo '<td class="icon"><img class="artefact_icon_' . $row['type'] . '" src="img/x.gif" alt="" title=""></td>';
        		echo '<td class="nam">';
        		echo '<a href="'.\App\Routes::BUILD.'?id=' . $id . '&show='.$row['id'].'">' . $row['name'] . '</a> <span class="bon">' . $row['effect'] . '</span><div class="info">'.TREASURY.' <b>20</b>, '.EFFECT.' <b>'.ACCOUNT.'</b></div>';
        		echo '</td>';
        		echo '<td class="pla"><a href="' . \App\Routes::MAP . '?d=' . $row['vref'] . '&c=' . $generator->getMapCheck($row['vref']) . '">' . $this->database->getUserField($row['owner'], "username", 0) . '</a></td>';
        		echo '<td class="al"><a href="allianz.php?aid=' . $this->database->getUserField($row['owner'], "alliance", 0) . '">' . $this->database->getAllianceName($this->database->getUserField($row['owner'], "alliance", 0)) . '</a></td>';
        		echo '</tr>';
        	}

?>
            <tr><td colspan="4"></td></tr>
            
            <?php
	}
?>
    	</tbody></table>
        
        <?php

        	include("upgrade.php");

?>
        
</div>
