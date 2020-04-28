<?php

/** --------------------------------------------------- **\
| ********* DO NOT REMOVE THIS COPYRIGHT NOTICE ********* |
+---------------------------------------------------------+
| Credits:     All the developers including the leaders:  |
|              Advocaite & Dzoki & Donnchadh              |
|                                                         |
| Copyright:   TravianX Project All rights reserved       |
\** --------------------------------------------------- **/

class Ranking
{
    public $rankarray = [];
    private $rlastupdate;

    public function getRank()
    {
        return $this->rankarray;
    }

    public function getUserRank($id)
    {
        global $database;
        
        $ranking = $this->getRank();
        $players = $database->getGameStatPlayersByRank(INCLUDE_ADMIN ? "10" : "8");
        
        if (count($ranking) > 0) {
            for ($i = 0; $i < ($players + 1); $i++) {
                if (isset($ranking[ $i ]['userid'])) {
                    if ($ranking[ $i ]['userid'] == $id && $ranking[ $i ] != "pad") {
                        $myrank = $i;
                    }
                }
            }
        }
    
        return $myrank;
    }

    public function procRankReq($get)
    {
        global $village, $session, $database;
        
        if (isset($get['id'])) {
            switch ($get['id']) {
                case 1:
                    $this->procRankArray();
                    break;
                case 8:
                    $this->procHeroRankArray();
                    if ($get['hero'] == 0) {
                        $this->getStart(1);
                    }
                    else {
                        $this->getStart($this->searchRank($session->uid, "uid"));
                    }
                    break;
                case 11:
                    $this->procRankRaceArray(1);
                    if ($this->searchRank($session->uid, "userid") != 0) {
                        $this->getStart($this->searchRank($session->uid, "userid"));
                    }
                    else {
                        $this->getStart(1);
                    }
                    break;
                case 12:
                    $this->procRankRaceArray(2);
                    if ($this->searchRank($session->uid, "userid") != 0) {
                        $this->getStart($this->searchRank($session->uid, "userid"));
                    }
                    else {
                        $this->getStart(1);
                    }
                    break;
                case 13:
                    $this->procRankRaceArray(3);
                    if ($this->searchRank($session->uid, "userid") != 0) {
                        $this->getStart($this->searchRank($session->uid, "userid"));
                    }
                    else {
                        $this->getStart(1);
                    }
                    break;
                case 31:
                    $this->procAttRankArray();
                    $this->getStart($this->searchRank($session->uid, "userid"));
                    break;
                case 32:
                    $this->procDefRankArray();
                    $this->getStart($this->searchRank($session->uid, "userid"));
                    break;
                case 2:
                    $this->procVRankArray();
                    $this->getStart($this->searchRank($village->wid, "wref"));
                    break;
                case 4:
                    $this->procARankArray();
                    if ($get['aid'] == 0) {
                        $this->getStart(1);
                    }
                    else {
                        $this->getStart($this->searchRank($get['aid'], "id"));
                    }
                    break;
                case 41:
                    $this->procAAttRankArray();
                    if ($get['aid'] == 0) {
                        $this->getStart(1);
                    }
                    else {
                        $this->getStart($this->searchRank($get['aid'], "id"));
                    }
                    break;
                case 42:
                    $this->procADefRankArray();
                    if ($get['aid'] == 0) {
                        $this->getStart(1);
                    }
                    else {
                        $this->getStart($this->searchRank($get['aid'], "id"));
                    }
                    break;
            }
        }
        else {
            $this->procRankArray();
            $this->getStart($this->searchRank($session->uid, "userid"));
        }
    }

    public function procRank($post)
    {
        if (isset($post['ft'])) {
            switch ($post['ft']) {
                case "r1":
                case "r11":
                case "r12":
                case "r13":
                case "r31":
                case "r32":
                    if (isset($post['rank']) && $post['rank'] != "") {
                        $this->getStart($post['rank']);
                    }
                    if (isset($post['name']) && $post['name'] != "") {
                        $this->getStart($this->searchRank(stripslashes($post['name']), "username"));
                    }
                    break;
                case "r4":
                case "r42":
                case "r41":
                    if (isset($post['rank']) && $post['rank'] != "") {
                        $this->getStart($post['rank']);
                    }
                    if (isset($post['name']) && $post['name'] != "") {
                        $this->getStart($this->searchRank(stripslashes($post['name']), "tag"));
                    }
                    break;
                case "r2":
                case "r8":
                    if (isset($post['rank']) && $post['rank'] != "") {
                        $this->getStart($post['rank']);
                    }
                    if (isset($post['name']) && $post['name'] != "") {
                        $this->getStart($this->searchRank(stripslashes($post['name']), "name"));
                    }
                    break;
            }
        }
    }

    private function getStart($search)
    {
        $multiplier = 1;
        if (!is_numeric($search)) {
            $_SESSION['search'] = $search;
        }
        else {
            if ($search > count($this->rankarray)) {
                $search = count($this->rankarray) - 1;
            }
            while ($search > (20 * $multiplier)) {
                $multiplier += 1;
            }
            $start = 20 * $multiplier - 19 - 1;
            $_SESSION['search'] = $search;
            $_SESSION['start'] = $start;
        }
    }

    public function getAllianceRank($id)
    {
        $this->procARankArray();
        while (1) {
            if (count($this->rankarray) > 1) {
                $key = key($this->rankarray);
                if (isset ($this->rankarray[ $key ]["id"]) && $this->rankarray[ $key ]["id"] === $id) {
                    return $key;
                    break;
                }
                else {
                    if (!next($this->rankarray)) {
                        return false;
                        break;
                    }
                }
            }
            else {
                return 1;
            }
        }
    }

    public function searchRank($name, $field)
    {
        while (1) {
            //$key = key($this->rankarray);
            for ($key = 0; $key < count($this->rankarray); $key++) {
                if ($this->rankarray[ $key ] != "pad") {
                    if ($this->rankarray[ $key ][ $field ] == $name) {
                        return $key;
                        break;
                    }
                }
            }
            if (!next($this->rankarray)) {
                if ($field != "userid") {
                    return $name;
                    break;
                }
                else {
                    return 0;
                    break;
                }
            }
        }
    }

    public function procRankArray()
    {
        global $database, $multisort;
        
        if ($database->countUser() > 0) {
            $holder = [];
            $datas = $database->getRankStat(INCLUDE_ADMIN ? "10" : "8", SHOW_NATARS ? 5 : 3);
        
            foreach ($datas as $result) {
                $value['userid'] = $result['userid'];
                $value['username'] = $result['username'];
                $value['oldrank'] = $result['oldrank'];
                $value['alliance'] = $result['alliance'];
                $value['aname'] = $result['allitag'];
                $value['totalpop'] = $result['totalpop'];
                $value['totalvillage'] = $result['totalvillages'];
                array_push($holder, $value);
            }
        
            $newholder = ["pad"];
            foreach ($holder as $key) {
                array_push($newholder, $key);
            }
            $this->rankarray = $newholder;
        }
    }
    
    public function procRankRaceArray($race)
    {
        global $database, $multisort;
        //$array = $database->getRanking();
        $holder = [];
        //$value['totalvillage'] = count($database->getVillagesID($value['id']));
        //$value['totalvillage'] = count($database->getVillagesID($value['id']));
        //$value['totalpop'] = $database->getVSumField($value['id'],"pop");
        //$value['aname'] = $database->getAllianceName($value['alliance']);
    
        $datas = $database->getRankStat(INCLUDE_ADMIN ? "10" : "8", null, $race);
        
        if (!empty($datas)) {
            foreach ($datas as $result) {
                $value['userid'] = $result['userid'];
                $value['username'] = $result['username'];
                $value['alliance'] = $result['alliance'];
                $value['aname'] = $result['allitag'];
                $value['totalpop'] = $result['totalpop'];
                $value['totalvillage'] = $result['totalvillages'];

                array_push($holder, $value);
            }
        }
        else {
            $value['userid'] = 0;
            $value['username'] = "No User";
            $value['alliance'] = "";
            $value['aname'] = "";
            $value['totalpop'] = "";
            $value['totalvillage'] = "";
            array_push($holder, $value);
        }
        
        //$holder = $multisort->sorte($holder, "'totalvillage'", false, 2, "'totalpop'", false, 2);
        $newholder = ["pad"];
        foreach ($holder as $key) {
            array_push($newholder, $key);
        }
        $this->rankarray = $newholder;
    }
    
    public function procAttRankArray()
    {
        global $database, $multisort;
        
        //$array = $database->getRanking();
        $holder = [];
    
        //$value['totalvillage'] = count($database->getVillagesID($value['id']));
        //$value['totalpop'] = $database->getVSumField($value['id'],"pop");
        $datas = $database->getRankAttackStat(INCLUDE_ADMIN ? "10" : "8");
    
        foreach ($datas as $key => $row) {
            $value['userid'] = $row['userid'];
            $value['username'] = $row['username'];
            $value['totalvillages'] = $row['totalvillages'];
            $value['id'] = $row['userid'];
            $value['totalpop'] = $row['pop'];
            $value['apall'] = $row['apall'];
            array_push($holder, $value);
            printf("\n<!-- %s %s %s %s -->\n", $value['username'], $value['totalvillages'], $value['totalpop'], $value['apall']);
        }
    
        //$holder = $multisort->sorte($holder, "'ap'", false, 2, "'totalvillages'", false, 2, "'ap'", false, 2);
        $newholder = ["pad"];
        foreach ($holder as $key) {
            array_push($newholder, $key);
        }
        $this->rankarray = $newholder;
    }
    
    public function procDefRankArray()
    {
        global $database, $multisort;
        
        //$array = $database->getRanking();
        $holder = [];
        $datas = $database->getRankDefStat(INCLUDE_ADMIN ? "10" : "8");
    
        foreach ($datas as $key => $row) {
            $value['userid'] = $row['userid'];
            $value['username'] = $row['username'];
            $value['totalvillages'] = $row['totalvillages'];
            $value['id'] = $row['userid'];
            $value['totalpop'] = $row['pop'];
            $value['dpall'] = $row['dpall'];
            array_push($holder, $value);
        }
    
        //$holder = $multisort->sorte($holder, "'dpall'", false, 2, "'totalvillage'", false, 2, "'dpall'", false, 2);
        $newholder = ["pad"];
        foreach ($holder as $key) {
            array_push($newholder, $key);
        }
        $this->rankarray = $newholder;
    }
    
    public function procVRankArray()
    {
        global $database, $multisort;
        $array = $database->getVRanking();
        $holder = [];
        foreach ($array as $value) {
            $coor = $database->getCoor($value['wref']);
            $value['x'] = $coor['x'];
            $value['y'] = $coor['y'];
            $value['user'] = $database->getUserField($value['owner'], "username", 0);
            
            array_push($holder, $value);
        }
        $holder = $multisort->sorte($holder, "'x'", true, 2, "'y'", true, 2, "'pop'", false, 2);
        $newholder = ["pad"];
        foreach ($holder as $key) {
            array_push($newholder, $key);
        }
        $this->rankarray = $newholder;
    }
    
    public function procARankArray()
    {
        global $database, $multisort;
        $array = $database->getARanking();
        $holder = [];
    
        foreach ($array as $value) {
            $memberlist = $database->getAllMember($value['id']);
            $totalpop = 0;
            foreach ($memberlist as $member) {
                $totalpop += $database->getVSumField($member['id'], "pop");
            }
            $value['players'] = count($memberlist);
            $value['totalpop'] = $totalpop;
            if (!isset($value['avg'])) {
                $value['avg'] = @round($totalpop / count($memberlist));
            }
            else {
                $value['avg'] = 0;
            }
        
            array_push($holder, $value);
        }
        $holder = $multisort->sorte($holder, "'totalpop'", false, 2);
        $newholder = ["pad"];
        foreach ($holder as $key) {
            array_push($newholder, $key);
        }
        $this->rankarray = $newholder;
    }
    
    public function procHeroRankArray()
    {
        global $database, $multisort;
        $array = $database->getHeroRanking();
        $holder = [];
        foreach ($array as $value) {
            $value['owner'] = $database->getUserField($value['uid'], "username", 0);
            $value['level'];
            $value['name'];
            $value['uid'];
        
            array_push($holder, $value);
        }
        $holder = $multisort->sorte($holder, "'experience'", false, 2);
        $newholder = ["pad"];
        foreach ($holder as $key) {
            array_push($newholder, $key);
        }
        $this->rankarray = $newholder;
    }
    
    public function procAAttRankArray()
    {
        global $database, $multisort;
        $array = $database->getARanking();
        $holder = [];
        foreach ($array as $value) {
            $memberlist = $database->getAllMember($value['id']);
            $totalap = 0;
            foreach ($memberlist as $member) {
                $totalap += $member['ap'];
            }
            $value['players'] = count($memberlist);
            $value['totalap'] = $totalap;
            if ($value['avg'] > 0) {
                $value['avg'] = round($totalap / count($memberlist));
            }
            else {
                $value['avg'] = 0;
            }
        
            array_push($holder, $value);
        }
        $holder = $multisort->sorte($holder, "'Aap'", false, 2);
        $newholder = ["pad"];
        foreach ($holder as $key) {
            array_push($newholder, $key);
        }
        $this->rankarray = $newholder;
    }
    
    public function procADefRankArray()
    {
        global $database, $multisort;
        $array = $database->getARanking();
        $holder = [];
        foreach ($array as $value) {
            $memberlist = $database->getAllMember($value['id']);
            $totaldp = 0;
            foreach ($memberlist as $member) {
                $totaldp += $member['dp'];
            }
            $value['players'] = count($memberlist);
            $value['totaldp'] = $totaldp;
            if ($value['avg'] > 0) {
                $value['avg'] = round($totaldp / count($memberlist));
            }
            else {
                $value['avg'] = 0;
            }
        
            array_push($holder, $value);
        }
        $holder = $multisort->sorte($holder, "'Adp'", false, 2);
        $newholder = ["pad"];
        foreach ($holder as $key) {
            array_push($newholder, $key);
        }
        $this->rankarray = $newholder;
    }
}

$ranking = new Ranking();
