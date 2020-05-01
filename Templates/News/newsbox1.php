<h5><img src="/img/en/t2/newsbox1.gif" alt="newsbox 1"></h5>

<?php
$serverStat = new \App\Models\User\ServerStatistic();
$online = $serverStat->getOnlinePlayers();
$topRankUser = $serverStat->getTopPlayerUsername();
?>

<div class="news">
    <table width="100%" border="0">
        <tr>
            <td align="left"><b>Online Users</td>
            <td>: <font color="Red"><?php echo $online ?> users</font></b></td>
        </tr>
        <tr>
            <td><b>Server Speed</td>
            <td>: <font color="Red"><?php echo ''.SPEED.'x';?></font></b></td>
        </tr>
        <tr>
            <td><b>Troop Speed</td>
            <td>: <font color="Red"><?php echo INCREASE_SPEED;?>x</font></b></td>
        </tr>
        <tr>
            <td><b>Evasion Speed</td>
            <td>: <font color="Red"><?php echo EVASION_SPEED;?></font></b></td>
        </tr>
        <tr>
            <td><b>Map Size</td>
            <td>: <font color="Red"><?php echo WORLD_MAX;?>x<?php echo WORLD_MAX;?></font></b></td>
        </tr>
        <tr>
            <td><b>Village Exp.</td>
            <td>: <font color="Red"><?php if(CP == 0){ echo "Fast"; } else if(CP == 1){ echo "Slow"; } ?></font></b>
            </td>
        </tr>
        <tr>
            <td><b>Beginners Prot.</td>
            <td>: <font color="Red"><?php echo (PROTECTION/3600);?> hrs</font></b></td>
        </tr>
        <tr>
            <td><b>Medal Interval</td>
            <td>: <font color="Red"><?php if(MEDALINTERVAL >= 86400){ echo ''.(MEDALINTERVAL/86400).' Days'; } else
                    if(MEDALINTERVAL < 86400){ echo ''.(MEDALINTERVAL/3600).' Hours'; } ?></font></b></td>
        </tr>
        <tr>
            <td><b>Server Start</td>
            <td>: <font color="Red"><?php echo START_DATE;?></font></b></td>
        </tr>
        <tr>
            <td><b>Best Player</td>
            <td>: <font color="Red"><?php echo $topRankUser ?></font></b></td>
        </tr>
    </table>
</div>
